# **nut-taal**
> A constructed language that is parsable by both computer and human. Inspired by [mini language](https://minilanguage.com)

### A taste of the language:
## [Try it out](https://mikeskoe.github.io/code-ish-app/)
maklik-taal | English 
-- | --
my <u>lief</u> dit <u>doen</u> | I <u>like</u> to <u>do</u> this
dit a kat e *my klein mooi* | This is my *small beutiful* cat
e *vandag* a sy <u>wil</u> i <u>speel</u> **met** jy | *Today*, he <u>wants</u> to <u>play</u> **with** you

### [More Examples](https://github.com/MikeSkoe/code-ish-app/blob/main/public/examples.csv)

---
## Grammar
### Low level
The language have three low-level language units:
- [Root](#Root) - a building block of the language
- [Mark](#Mark) - explains if the root a noun, verb or an ad (a modifier, like an adjective or adverb)
- [Conjugation](#Conjugation) - introduces a [phrase](#Phrase) (clause), to make sentences richer

#### **Root**
Can be collapsed to make a compound word, using a `*-*-*` pattern.
It keeps vocabulary richer and the dictionary shorter.

It can have three states, depending on position in a sentence:
- noun - a thing
- <u>verb</u> - an action
- *ad* - a modification, like adjective or adverb

#### **Mark**
Placed before a root
- `a` - introduces a noun
- `i` - introduces a verb
- `e` - introduces a modificator

There are some [patterns](#patterns), where the marks should be dropped.

#### **Conjugation**
Placed before a [phrase](#Phrase).
Examples of Conjugations could be words like:
- **want** - because
- **in** - in
- **vir** - to, for
---

### Middle level
Words are middle level units.
They consist of roots and marks and can have three states: **noun**, **verb** and **ad**

#### Patterns
Noun | Verb | Ad
-- | -- | --- 
`a *` | `i *` | `e *`
`[BEGINING OF THE SENTENCE] *` | `[NOUN] *` | `[AD] *`
`[Conjugation] *` ||
`[VERB] *` ||

---
### High level
#### Phrase
The phrase (or clause) is a cluster of non-conjugation words.

#### Subject
The first noun in a phrase

#### Infinitive
The second verb in a phrase

#### Object
The second noun in a phrase

---
## Vocabulary
Ideally, every root should have a meaning, be it a noun, verb, or adjective, as long as it is clear and makes sense.
Therefore, related words could be collapsed into a single root.
For example, a root "vra" could mean "question" as a noun, "to ask" as a verb, and "curious/curiously" as an adjective.

At the same time, to prevent ambiguity, a single root should not cover too wide range of meanings or unrelated ideas.
The dictionary should be optimised, not limited.
Additionally there should not be a root, like English **like**, that could mean **alike** and **to love**, since these are two completely different meanings

At the moment the dictionary is not perfect.
Some compound words should be replaced with more implicit compounds.
Some words could be replaced with synonyms.
Some words could be added.
I hope the dictionary will be better and better as the comunity grows.

### Why Afrikaans?
> The dictionary is not tightly coupled with the language.
It is rather a dependency.

At the moment all roots come from Afrikaans.
I did it for few reasons:
- I think it is better to have only one source of roots.
Plus there will always be someone who does not know a single word in any possible conlang
- It allows to use any translator, that supports Afrikaans, in cases when the dictionary does not include a word you need. (Plus some translators exposes speach!)
- It one of the simples natural languages.
It is a simplified Dutch, which is a Germanic language (like German and English), located at Africa!
- It is much simpler to read and pronounce than English, since spelling is regular
