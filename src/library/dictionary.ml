include AbstractDict

module MyDict = Map.Make(String)

module Utils = struct
   let loadDict url dict makeEntity = (Fetch.fetch url)
      |> Js.Promise.then_ Fetch.Response.text
      |> Js.Promise.then_ (fun text ->
         let words = Belt.List.map
            (String.split_on_char '\n' text)
            (String.split_on_char ';')
         in
         dict := Belt.List.reduce
            words
            dict.contents
            (fun acc line ->
               MyDict.add
               (Belt.List.getExn line 0)
               (makeEntity line)
               acc
            );
         Js.Promise.resolve dict.contents
      )
end

module Term: TERMIN_DICTIONARY = struct
   let dict: term MyDict.t ref = ref MyDict.empty

   let dictProm = Utils.loadDict "dictionary.csv" dict
      (fun line -> ({
         str=(Belt.List.getExn line 0);
         noun=(Belt.List.getExn line 1);
         verb=(Belt.List.getExn line 2);
         ad=(Belt.List.getExn line 3);
         description=(Belt.List.getExn line 4);
      }))

   let all = dictProm
      |> Js.Promise.then_ (fun dict ->
         Belt.List.map (MyDict.bindings dict) (fun (_, term) -> term)
         |> Js.Promise.resolve
      )

   let parse string = MyDict.(find_opt string dict.contents)
   let show ({ str }: term) = str
end

module Conj: CONJ_DICTIONARY = struct
   let nounMark = "a"
   let verbMark = "i"
   let adMark = "e"

   let dict: conjTerm MyDict.t ref = ref MyDict.empty
   
   let dictProm = Utils.loadDict "particles.csv" dict
      (fun line -> ({
         str=(Belt.List.getExn line 0);
         definition=(Belt.List.getExn line 1);
         description=(Belt.List.getExn line 2);
      }))

   let all = dictProm
      |> Js.Promise.then_ (fun dict ->
         Belt.List.map (MyDict.bindings dict) (fun (_, term) -> term)
         |> Js.Promise.resolve
      )

   let mem key = Belt.Option.isSome MyDict.(find_opt key dict.contents)
   let parse key = MyDict.find_opt key dict.contents
   let show ({ str }: conjTerm) = str
end
