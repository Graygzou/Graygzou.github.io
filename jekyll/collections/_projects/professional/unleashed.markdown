---
title: Unleashed
description: UI creation and integration on a 3D post-apocalyptic monsters open world.
date: 2018-08-08
tags: []
languages:
  - name: C#
    percentage: 100.0
    color: "#178600"
tags: ['unity3d', 'ECS', 'UI integration', 'HUD']
category: 'professional'
pitch: "Initially _Unleashed_ was supposed to be a battle royal between monsters in a 3D post-apocalyptic world. 
        Each player was going to start as a small Kaiju (monster). 
        <br/>
        <br/>
        He will then attack other players or find \"DNA\" in order to evolve and become stronger. 
        Each Kaiju will have special abilities and also a \"type\" like tank, bruiser, etc.
        The objective being to be the last standing of course."
platforms: Windows
engines: Unity3D
tools: [Speed-Tree, Git, JIRA, Confluence]
duration: "2 months"
team-size:
  - role: Programmer
    amount: 4
  - role: Artists
    amount: 4
  - role: Producers
    amount: 2
  - role: Game Designer
    amount: 1
remote-team: yes
main-roles: [UI Programmer, Game Programmeur]
project_links:
  #- name: steam
  #  url: todo
additional-sections:
  - name: constraints
    list: ["The project was made in ECS (now called DOTS in Unity terminology)"]
  - name: tasks
    list: ["UI Assets integration made by the artists.",
           "Plug UI feedbacks to the gameplay (health bar, stamina bar, etc.)",
           "Compare different way to animate the UI in Unity (Standard, Unity-UI-Extensions, render texture)."]
---
<!---
Gregoire Boiron <gregoire.boiron@gmail.com>
Copyright (c) 2018-2019 Gregoire Boiron  All Rights Reserved.
--->

Detailed Info
--------------------
{% include helpers/side-image.md path="/assets/project-images/unleashed/carousel/concept-art[r500x500].png" basename="concept-art[r500x500]" css="right-side-img" %}

I only worked less than 2 months on this project because the scope of it has been shortened.
The new pitch was the following :
You play as Meiji, a powerful Kaiju who return on his origins as his childhood memory comes back.
As Meiji journeys, it runs into hostile and territorial forces that try to stop it :
surviving human population, AI robots and hostiles Kaiju will strew the way to her past. 
  
As the story goes one, Meiji will learn about himself by also make decisions that could change the world he currently knows.

### What I've done

* HUD Integration
* HUD Animations
* Communicate with various member of the team with different knowledge.

{% include helpers/side-image.md path="/assets/project-images/unleashed/carousel/environment-skull[r500x500].png" basename="environment-skull[r500x500]" css="right-side-img" %}

#### ECS
I had to learn a bit what ECS means in Unity. 
I'd already made a project with the "Entity Component System" paradigm in the past so I knew some of the theory behind it.

I still had to learn the technical details of Unity approach like: 
- You can only declare `mutables types` like integers, byte, etc. in Components. Arrays are forbidden.
- You cannot use `mathf`.
- You can't have direct references between objects. You can only declare `struct` with a field and find the ref later on to add it to the right field.

The UI was only made with the old GameObject methods since ECS was not ready for that yet. 
But I had to write code in ECS in order to gather the HUD information I needed.

Basically I had a `ResourceSystem` and modify existing systems to be able to retrieve info through events to display it correctly (health, speed, shields, cooldowns, etc.).

#### Head Up Display (HUD)
The in-game HUD had those features:

{% include helpers/side-image.md path="/assets/project-images/unleashed/carousel/meiju[r500x500].png" basename="meiju[r500x500]" css="right-side-img" %}

| Health bar | Experience bar |
| Shield bar | Rage gauge |
| Stamina bar | Damages VFX |
| Abilities preview and cooldowns | |

I also did some effects like a fade-in/fade-out when the HUD was not changed.
I did many iterations on those aspects, without and with artists assets.