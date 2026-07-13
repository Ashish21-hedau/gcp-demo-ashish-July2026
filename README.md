<!-- 1. steps:
steps:
Pipeline mein jitne bhi tasks execute honge, unki list yahan hoti hai.
Har - ek naya step hota hai.

2. id: 'branch name'
id: 'branch name'

Is step ka naam (identifier) hai.
Logs mein ye naam dikhega.
Iska execution par koi effect nahi hota, sirf identification ke liye hota hai.

3. name: 'alpine'
name: 'alpine'

Is step mein kaunsa Docker image use hoga.
alpine ek bahut chhota Linux image hai.

Matlab pipeline ek temporary Alpine Linux container start karegi.
to Ubuntu container start hota.

4. entrypoint: 'sh'
entrypoint: 'sh'

Default Alpine container ka command alag ho sakta hai.
Yahan hum explicitly bol rahe hain:
Container ke andar sh shell run karo.
Ye almost terminal open karne jaisa hai.

5. args:
args:

sh ko kaunse arguments dene hain, woh yahan likhte hain.

6. - '-c'
sh -c ka matlab hota hai:
Agli string ko shell command ki tarah execute karo.

7. |
- |
YAML mein | ka matlab hai: Neeche likha hua poora multiline text ek hi string maana jayega.

8 . echo
BRANCH_NAME=feature/payment
 main


 # Google Cloud Build YAML Explanation
yaml
steps:
  - id: 'branch name'
    name: 'alpine'
    entrypoint: 'sh'
    args:
      - '-c'
      - |
        echo "***********************"
        echo "$BRANCH_NAME"
        echo "***********************"
---

1.steps:

yaml
steps:


-steps pipeline ka main section hota hai.
- Iske andar jitne bhi tasks execute honge, unki list hoti hai.
- Har- ek naya step represent karta hai.

Example:

yaml
steps:
  - Step 1
  - Step 2
  - Step 3


Pipeline inhe sequence mein execute karegi.

---

# 2.id: 'branch name'

yaml
id: 'branch name'
Ye step ka identifier (naam) hai.

Purpose:

- Logs mein isi naam se dikhega.
- Debugging mein help karta hai.
- Execution par koi effect nahi hota.

Example Log:


Starting Step #0 - "branch name"
Finished Step #0 - "branch name"


---

# 3.name: 'alpine'

yaml
name: 'alpine'


Ye batata hai ki is step mein kaunsa Docker image use hoga.

Yahan image hai:


alpine


Alpine Linux:

- Lightweight Linux distribution
- Size bahut chhota
- Fast startup
- CI/CD pipelines mein commonly use hota hai

Cloud Build internally kuch is tarah container start karti hai:


docker run alpine


Agar likhte:

yaml
name: ubuntu


to Ubuntu container start hota.

---

# 4.entrypoint: 'sh'

yaml
entrypoint: 'sh'


Entrypoint batata hai ki container start hone ke baad kaunsi command run hogi.

Yahan:


sh


run hoga.

Matlab shell open hogi.

Jaise terminal mein:

bash
sh


---

# 5.args:

yaml
args:


Yesh command ko arguments pass karta hai.

Example:


sh <arguments>


---

# 6.- '-c'

yaml
- '-c'


Shell ka-c option ka matlab hai:

> Next string ko shell command ki tarah execute karo.

Example:

bash
sh -c "echo Hello"


Output:


Hello


---

# 7.| (Pipe Symbol)

yaml
- |


YAML mein| ka matlab hota hai:

Neeche likhi hui multiple lines ko ek single string maana jayega.

Example:

yaml
- |
  echo Hello
  echo World


Actually execute hota hai:

bash
sh -c '
echo Hello
echo World
'


---

# 8.echo

bash
echo "***********************"


echo screen par text print karta hai.

Example:

bash
echo "Hello"


Output:


Hello


---

# 9.$BRANCH_NAME

bash
echo "$BRANCH_NAME"


BRANCH_NAME ek environment variable hai.

Cloud Build trigger jab kisi Git branch se run hota hai to us branch ka naam is variable mein aa jata hai.

Example:

Agar build branch:


main


se trigger hui hai

to output:


main


Agar build branch:


feature/payment


se trigger hui hai

to output:


feature/payment


Agar variable available nahi hai

to output blank aayega.

---

# Complete Output Example

### Case 1


BRANCH_NAME=main


Output:


***********************
main
***********************


---

### Case 2


BRANCH_NAME=feature/payment


Output:


***********************
feature/payment
***********************


---

# Execution Flow


Pipeline Starts
        │
        ▼
Create Alpine Container
        │
        ▼
Run sh
        │
        ▼
Execute Commands
        │
        ▼
echo ***********************
echo $BRANCH_NAME
echo ***********************
        │
        ▼
Display Output


---

# Summary

| Keyword | Purpose |
|----------|----------|
|steps | Pipeline ke tasks |
|id | Step ka naam |
|name | Docker image |
|entrypoint | Kaunsi command start hogi |
|args | Command ke arguments |
|-c | Next string ko command ki tarah execute karo |
|| | Multiline string |
|echo | Text print karta hai |
|$BRANCH_NAME | Current Git branch ka naam | -->