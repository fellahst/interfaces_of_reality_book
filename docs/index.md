---
layout: default
title: Interfaces of Reality
subtitle: How Life, Mind, and Machines Navigate a World of Possibilities
---

<div class="home">
    <header class="page-header page-header--home">
        <h1>{{ page.title }}</h1>
        <div class="subtitle">{{ page.subtitle }}</div>
        <div class="author">by {{ site.author }}</div>
    </header>

    <section id="book-overview" class="home-video-section" aria-labelledby="home-video-heading">
        <div class="video-block">
            <h2 id="home-video-heading" class="video-block-title">Book overview</h2>
            <p class="video-block-intro">
                More on <a href="{{ site.youtube_channel_url }}" target="_blank" rel="noopener noreferrer">YouTube</a> <span class="video-block-handle">{{ site.youtube_channel_handle }}</span>.
            </p>
            <div class="youtube-embed-wrap">
                <iframe src="https://www.youtube-nocookie.com/embed/{{ site.youtube_book_overview_id }}"
                        title="Book overview: Interfaces of Reality"
                        allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
                        referrerpolicy="strict-origin-when-cross-origin"
                        allowfullscreen
                        loading="eager"></iframe>
            </div>
        </div>
    </section>

    <section class="home-intro" aria-labelledby="home-lead-heading">
        <div class="home-intro-inner">
            <div class="home-intro-text">
                <h2 id="home-lead-heading" class="home-lead-heading">Reality is structured by boundaries</h2>
                <p class="home-lead">Reality organizes itself through <strong>interfaces</strong>: boundaries that constrain interaction while enabling coordination. These interfaces stack hierarchically—each layer builds on those below—so new behavior emerges through accumulated constraints, not by replacing what came before.</p>
                <div class="home-cta">
                    <a href="{{ '/get-the-book.html' | relative_url }}" class="btn-home btn-home--primary">Get the book</a>
                    <a href="#book-overview" class="btn-home btn-home--secondary">Watch overview</a>
                </div>
            </div>
            <div class="home-intro-media">
                <figure class="home-figure">
                    <img src="{{ '/assets/interface_stack.jpg' | relative_url }}" alt="Diagram: the complete interface stack from physics to technology" width="900" loading="eager">
                    <figcaption>The complete interface stack</figcaption>
                </figure>
            </div>
        </div>
    </section>

    <section class="layers-section" aria-labelledby="layers-heading">
        <h2 id="layers-heading" class="layers-section-title">Explore each layer</h2>
        <p class="layers-section-lead">Nine stops from the foundations of physics to consciously designed systems. Each page is a short guided tour—open any card to go deeper.</p>

        <div class="layers-grid">
    <a href="{{ '/layer-01-physical.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-01">
            <div class="layer-number">Layer 1</div>
            <h2>Physical Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>The Foundation of Reality</strong></p>
            <p>Symmetries, conservation laws, fields, and particles. The most fundamental level of reality, before life or mind enter the picture.</p>
            <ul class="key-points">
                <li>Symmetries as source code</li>
                <li>Conservation laws as boundaries</li>
                <li>Fields and particles as stable patterns</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-02-thermodynamic.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-02">
            <div class="layer-number">Layer 2</div>
            <h2>Thermodynamic Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Managing Entropy, Creating Order</strong></p>
            <p>Interfaces that allow entropy to be exported while maintaining local order. Enables complexity to emerge from simple processes.</p>
            <ul class="key-points">
                <li>Entropy management</li>
                <li>Dissipative structures</li>
                <li>Far-from-equilibrium systems</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-03-spacetime.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-03">
            <div class="layer-number">Layer 3</div>
            <h2>Spacetime Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>The Framework of Interaction</strong></p>
            <p>Creates the framework within which everything else operates. Establishes locality and causality.</p>
            <ul class="key-points">
                <li>Locality constraints</li>
                <li>Causality structure</li>
                <li>Foundation for all interaction</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-04-biological.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-04">
            <div class="layer-number">Layer 4</div>
            <h2>Biological Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Self-Maintaining Boundaries</strong></p>
            <p>Introduces active self-maintenance. Membranes, regulatory networks, and metabolic pathways that maintain life.</p>
            <ul class="key-points">
                <li>Cell membranes</li>
                <li>Active self-maintenance</li>
                <li>Autonomy and persistence</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-05-sensorimotor.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-05">
            <div class="layer-number">Layer 5</div>
            <h2>Sensorimotor Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Bridging Organism and Environment</strong></p>
            <p>Perception and action loops that enable agency. Active engagement with the world.</p>
            <ul class="key-points">
                <li>Active perception</li>
                <li>Purposeful action</li>
                <li>Emergence of agency</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-06-cognitive.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-06">
            <div class="layer-number">Layer 6</div>
            <h2>Cognitive Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Creating Intelligence and Selves</strong></p>
            <p>Predictive models, Markov blankets, and inferential processes. Creates intelligence and the self.</p>
            <ul class="key-points">
                <li>Markov blankets</li>
                <li>Predictive models</li>
                <li>Hierarchy of selves</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-07-semantic.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-07">
            <div class="layer-number">Layer 7</div>
            <h2>Semantic Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Stabilizing Meaning Across Systems</strong></p>
            <p>Language, symbols, and ontologies that enable meaning to stabilize and be shared. Creates knowledge and culture.</p>
            <ul class="key-points">
                <li>Shared meaning</li>
                <li>Language as boundary</li>
                <li>Ontologies as contracts</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-08-social.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-08">
            <div class="layer-number">Layer 8</div>
            <h2>Social Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Coordinating Behavior Across Individuals</strong></p>
            <p>Norms, institutions, and legal frameworks that enable cooperation and collective action.</p>
            <ul class="key-points">
                <li>Social norms</li>
                <li>Institutions</li>
                <li>Collective action</li>
            </ul>
        </div>
    </a>

    <a href="{{ '/layer-09-technological.html' | relative_url }}" class="layer-card">
        <div class="layer-card-header layer-09">
            <div class="layer-number">Layer 9</div>
            <h2>Technological Interfaces</h2>
        </div>
        <div class="layer-card-content">
            <p><strong>Consciously Designed Systems</strong></p>
            <p>APIs, protocols, and user interfaces explicitly designed by humans. Shows how we can consciously design what nature discovers.</p>
            <ul class="key-points">
                <li>APIs and protocols</li>
                <li>User interfaces</li>
                <li>Conscious design</li>
            </ul>
        </div>
    </a>
        </div>
    </section>
</div>
