module.exports =

  navigation:
    home: "Home"
    classify: "Classify"
    about: "About"
    team: "Team"
    partners: "Partners"
    discuss: "Talk"
    blog: "Blog"
    profile: "Profile"

  homePage:
    callToAction: "Get Hunting!"
    sponsorCredit: "This project is part of the Medical Research Council Centenary year programme of activities and is generously supported by the <a href=\"http://www.mrc.ac.uk/mrf\">Medical Research Foundation</a>"
    slides:
      first:
        imageHeader: "Human"
        imageTagline: "over 100 billion nerve cells"
        header: "One little worm can help scientists understand big genetic mysteries"
        text: "Scientists are discovering how genes affect behaviour in nematode worms. These discoveries can help us understand our own genes, too."
      second:
        imageHeader: "Worm"
        imageTagline: "over 300 nerve cells"
        header: "Medical Research Live"
        text: "This project is brought to you by the Medical Research Council as part of its centenary year."
      third:
        header: "Your job is to find the eggs!"
        text: "By watching a short video and spotting the worms laying eggs we can understand better how our genes work."

  classifyPage:
    game:
      egg: 'egg'
      eggs: 'eggs'

    actions:
      favorite: '&#9733; Favorite'
      discuss: 'Talk'
      next: 'Next worm'
      help: 'Help'
      tutorial: 'Tutorial'
      siteIntro: 'Site Intro'
      guide: 'Guide'
      eggLaying: 'Egg Laying'

    messages:
      startPrompt:
        desktop: "Click to start"
        touch: "Tap to start"
      onStart:
        desktop: "Press \"Z\" if you see the worm lay an egg"
        touch: "Press \"Egg Laying\" if you see the worm lay an egg"
      onRemoveMark: "You removed a mark at $time"

    stats:
      player: "Player: $name"
      score: "Score: $amount"
      signInPrompt: "Sign in to play"
      eggAt: "Egg at:"
      firstSpotter: "First spotter!"
      spotterAward: "You are the first person to see this worm! You get a 200 point spotter award"
      noTimings: "No other timings available yet!"

    help:
      header: "Help"
      content: """
        <p>The egg will almost always appear in the middle segment of a worm at it's side. There will typically be a red dot that follows closely where eggs appear.</p>
        <p>You can erase an accidental marking by clicking the "x" in the space where the time is shown.</p>
        <p>It is rare to see an egg. Most videos won't have anything to mark, so don't feel as if you are doing something wrong if you go a few videos not marking anything.</p>
        <p>You can click the video to play/pause it at any time.</p>
      """
      keyboardShortcuts:
        header: "Keyboard Shortcuts"
        keys:
          x: "<span class='key'>X</span> starts the video"
          z: "<span class='key'>Z</span> marks an egg-laying event"

  guide:
    content: '''
      <section>
        <p>When a worm lays an egg on these videos, it appears as a small, dark bulge that pops out suddenly around the middle of its body (which is marked here by a red dot). Sometimes, a worm will lay multiple eggs at once, or several in rapid succession.</p>
        <figure class="video-container">
          <div class="overlay"></div>
          <video id="guide-video-one" class="video-js vjs-default-skin" poster="https://www.wormwatchlab.org/subjects/51b9c2122d5d3ad242007481.jpg" width="auto" height="auto" controls>
            <source src="https://www.wormwatchlab.org/subjects/51b9c2122d5d3ad242007481.mp4" type="video/mp4">
          </video>
          <figcaption>Worm laying one egg at 0:03.<br><a href="https://talk.wormwatchlab.org/#/subjects/AWS0000n0c" target="_blank">View Talk video source.</a></figcaption>
        </figure>
        <figure class="video-container">
          <div class="overlay"></div>
          <video id="guide-video-two" class="video-js vjs-default-skin" poster="https://www.wormwatchlab.org/subjects/51b7af002d5d3ad242003a73.jpg" width="auto" height="auto" controls>
            <source src="https://www.wormwatchlab.org/subjects/51b7af002d5d3ad242003a73.mp4" type="video/mp4">
          </video>
          <figcaption>Worm laying multiple eggs at 0:03.<br><a href="https://talk.wormwatchlab.org/#/subjects/AWS0000bjo" target="_blank">View Talk video source.</a></figcaption>
        </figure>
      </section>
      <section>
        <p>If you see an egg being laid, pause the video by clicking on it, then use the blue scroll bar to scroll to the point where the worm laid the egg and press "Z" or tap "Egg Laying" to get an accurate timing. If the worm lays multiple eggs during the video, press "Z" or tap "Egg Laying" once for each egg.</p>
        <p>If you make a mistake, you can undo it by clicking the X next to the mistaken timing.</p>
        <figure>
          <img src="images/field-guide/wwl-success.gif" alt="Successful classification">
          <figcaption>Successful classification</figcaption>
        </figure>
        <figure>
          <img src="images/field-guide/wwl-remove-score.gif" alt="Cancelling classification">
          <figcaption>Cancelling classification</figcaption>
        </figure>
      </section>
      <section>
        <p>There may already be eggs present on the plate or next to the worm at the start of the video.  <strong>Don't mark these; only mark eggs that are laid while you're watching.</strong></p>
        <p>Also look out for food piles&mdash;sometimes the worm is in a pile of food and this can look like an egg. Eggs will appear more suddenly than a patch of food that gets disturbed.</p>
        <figure>
          <img src="images/field-guide/egg-present.png" alt="Example of already present eggs">
          <figcaption>Eggs already present</figcaption>
        </figure>
        <figure>
          <img src="images/field-guide/food-present.png" alt="Example of food present">
          <figcaption>Food present</figcaption>
        </figure>
      </section>
      <section>
        <p>Most videos will not have egg-laying events. We only expect eggs in one out of every 30-50 videos. Even if you don't find an egg, every video that you watch helps the project!</p>
        <p>If you want to classify faster, you may drag the scroll bar to the right to move quickly through each video and scan for new eggs.</p>
        <p>Finally, don't stress if you're not sure about whether something is an egg or not! Take your best guess. Several people will see each video, so don't worry about any errors.</p>
      </section>
      <div class="scroll-up">
          <img src="images/return-top.svg" alt="Back to top button">
      </div>
    '''

  siteIntro:
    1: '''Welcome to Worm Watch Lab! By tracking the egg-laying behavior of nematode worms, you'll be helping us study the function of genes similar to those important for human brain function.'''
    2: '''View each 30-second video of a worm, and press "Z" or tap "Egg Laying" whenever you see the worm lay an egg. Eggs will appear suddenly as small, dark bulges near the red dot that marks each worm's midsection.'''
    3: '''Press "Z" or tap "Egg Laying" for each egg that is laid. <strong>Do not mark eggs that are already there.</strong> And don't worry if you're unsure&ndash;many people will see each video, so mistakes are not a big problem.'''
    4: '''It's okay if you don't see an egg laid; we only expect it once in every 30-50 videos. Keep watching, though, and you're likely to spot one. Each video that you watch helps either way!'''
    5: '''If you need more help, you can click "Field Guide" for more examples of egg-laying behavior. You can also chat with other volunteers at our Talk page, or check out the Worm Watch Lab blog. Good luck, and thanks!'''

  profilePage:
    wormsObserved: "Worms Observed: $count"
    score: "Score: $score"
    notLoggedIn: "Login to view profile"

  partnersPage:
    header: "Partner Organisations"
    partners:
      mrc:
        name: "MRC Laboratory of Molecular Biology"
        image: "images/mrc-lmb-logo.svg"
        description:
          "<p>The MRC Laboratory of Molecular Biology (LMB) is a world-class research laboratory, dedicated to understanding important biological processes at the molecular level - with the goal of using this knowledge to tackle major problems in human health and disease. The LMB is one of the birthplaces of modern molecular biology. Many techniques were pioneered at the laboratory, including DNA sequencing, methods for determining the three-dimensional structure of proteins and the development of monoclonal antibodies.</p>
          <p>Over the years, the work of LMB scientists has attracted nine Nobel prizes, shared between 13 LMB scientists, dozens of Royal Society awards and numerous other scientific honours.</p>"
      mrf:
        name: "Medical Research Foundation"
        image: "images/mrc-mrf-logo.svg"
        description:
          "<p>The Medical Research Foundation is the Medical Research Council's independently managed charity. It receives funds from the giving public to support medical research, training, public engagement and dissemination of knowledge.</p>
          <p>Since it was first established in 1920, the MRC has been able to accept charitable bequests, endowments and donations from the public to contribute towards the costs of the research that it undertakes. The MRC registered these charitable funds with the Charity Commission in the late 1960's and its charity - the Medical Research Foundation - has been successfully supporting medical research for over 80 years.</p>"
      csc:
        name: "Clinical Sciences Center"
        image: "images/mrc-csc-logo.svg"
        description:
          "<p>The CSC aims to be at the forefront of innovative biomedical research and in partnership with Imperial College London and others, to promote the translation of its research for maximal benefit. The institute trains and mentors the next generation of clinical and non-clinical scientists and strives to enhance the public's interest, understanding and trust in science.<p>"
      genie:
        name: "GENiE"
        image: "images/genie-logo.png"
        description:
          "<p>GENiE (Group of <em>C. elegans</em> New Investigators in Europe) is a network of more than 80 worm labs that aims to encourage interdisciplinary scientific communication, accelerate the spread of new nematode techniques, and improve the establishment of collaborations between European laboratories. Part of its mission is also to reach out to the public to improve understand of nematode biology and the use of <em>C. elegans</em> as a model organism in biomedical research.</p>"
      zooniverse:
        name: "Zooniverse"
        image: "images/zooniverse-icon-web-black.png"
        description:
          "<p>The Zooniverse and the suite of projects it contains is produced, maintained and developed by the Citizen Science Alliance. The member institutions of the CSA work with many academic and other partners around the world to produce projects that use the efforts and ability of volunteers to help scientists and researchers deal with the flood of data that confronts them.</p>"

  aboutPage:
    content: """
      <section class="about-section">
        <h2>Our small distant cousins</h2>
        <figure class="about-figure"><img src="images/c-elegans.jpg" alt="C. Elegans"><figcaption>Credit: J&uuml;rgen Berger<br>Max Planck Institute for Developmental Biology</figcaption></figure>
        <p>We watch movies of the nematode worm <em>C. elegans</em> to understand how the brain works and how genes affect behaviour. The idea is that if a gene is involved in a visible behaviour, then mutations that break that gene might lead to detectable behavioural changes. The type of change gives us a hint about what the affected gene might be doing.</p>
        <p>Although it is small and has far fewer cells than we do, <em>C. elegans</em> has almost as many genes&mdash;and because we share a common ancestor even with worms, many of them are closely related to human genes. This presents us with the opportunity to study the function of genes that are important for human brain function in an animal that is easier to handle, great for microscopy and genetics, and has a generation time of only a few days.</p>
      </section>
      <section class="about-section">
        <h2>The Importance of Egg Laying</h1>
        <figure class="about-figure"><iframe width="200" src="//www.youtube.com/embed/H131yA9AYss" frameborder="0" allowfullscreen></iframe><figcaption>Credit: Robyn Branicky</figcaption></figure>
        <p>Egg laying in <em>C. elegans</em> requires the proper functioning of a neural circuit to activate the muscles that open the vulva to expel eggs. This circuit is modulated by a neurotransmitter called serotonin; the same molecule that affects mood in humans. Antidepressants like prozac work by stimulating serotonergic signaling in humans. They also work in worms and they stimulate egg laying!</p>
        <p>If we observe a mutant that lays more or fewer eggs than normal, this is a hint that something has gone wrong in the egg laying neural circuit or muscles. This can have far reaching implications, maybe even teaching us something about genes involved in depression in humans. The challenge is that there are thousands of genes without a known function and screening for worms with egg laying defects is time consuming. That's why we need your help!</p>
      </section>
      <section class="about-section">
        <h2>Worm Tracking</h2>
        <figure class="about-figure"><img src="images/lab-setup.jpg" alt="Worm Lab Setup"><figcaption>Credit: Ralf Sommer</figcaption></figure>
        <p>We have built tracking microscopes to record video of crawling worms. A USB microscope is mounted on a motorised stage connected to a computer. When the worm moves, the computer analyses the changing image and commands the stage to move to re-centre the worm in the field of view. Because the trackers work without supervision, we can run eight of them in parallel to collect a lot of movies.
        <p>If you'd like to learn more about worm tracking (or even build a tracker yourself!), we have a parts list and instructions on our <a href="http://www.mrc-lmb.cam.ac.uk/wormtracker/">tracking website</a></p>
      </section>
    """

  teamPage:
    header: "The Team"
    team:
      brown:
        name: "Andr&#233; Brown"
        image: "images/team/andre.jpg"
        bio: "Andr&#233; is a group leader at the MRC Clinical Sciences Centre in London and heads the Behavioural Genomics lab in the Integrative Biology section. Originally from Newfoundland, he is a physicist by training. After finishing his PhD, he switched from pulling molecules to watching worms. He never ceases to be amazed, period."
      grundy:
        name: "Laura Grundy"
        image: "images/team/laura.jpg"
        bio: "Laura graduated from Anglia Ruskin University with a BSc in molecular biology and spent two years as a pharmaceutical analyst before joining the MRC Lab of Molecular Biology as a Research Assistant. She spent two years gathering data for the worm tracking project and is now a part time student, part time worm tracker in the lab. She is also very glad that she won't be counting all the eggs alone!"
      yemini:
        name: "Ev Yemini"
        image: "images/team/ev.jpg"
        bio: "After graduating from Columbia University with a pre-medical BA concentrating in mathematics and computer science, Eviatar Yemini joined the world of high-finance and high-tech. Unfulfilled and desiring a career in neuroscience, he completed his PhD at Cambridge, investigating the contribution of genetics to behavior and, now, continues his investigations as a postoctoral HHMI Research Associate at Columbia University. An avid fan of the arts, Ev has found time to perform in several theatrical performances at Cambridge and contribute to an art exhibit for the London Science Museum."
      jucikas:
        name: "Tadas Jucikas"
        image: "images/team/tadas.jpg"
        bio: "Tadas is a PhD student at the MRC Lab of Molecular Biology with a background in computer science and bioinformatics. He has been working on worm tracking for several years and currently manages the home-built analysis pipeline for the worm tracking project."
      schafer:
        name: "Bill Schafer"
        image: "images/team/bill.jpg"
        bio: "Bill is a group leader at the MRC Lab of Molecular Biology and heads the cellular and molecular mechanisms of behaviour group in the Cell Biology Division. He is interested in understanding how nervous systems process information and generate behaviour at the most basic level: that of molecules and cells."

  mutations:
    acr:
      name: 'Acetylcholine Receptor'
      description: 'Worms in this group have mutations affecting molecules on the surface of cells that bind to the neurotransmitter acetylcholine.'
    asic:
      name: 'Acid-sensing/Amiloride-Sensitive Ion Channel'
      description: 'Worms in this group have mutations that may affect sensation and learning in C. elegans.'
    cat:
      name: 'abnormal Catecholamine distribution'
      description: 'Worms in this group have mutations in genes that affect the production of some types of neurotransmitters, like dopamine.'
    daf:
      name: 'abnormal Dauer Formation'
      description: 'When stressed early in life, normal worms are able to develop into a long-lived form called a dauer larva. Worms in this group have defects in dauer formation..'
    del:
      name: 'Degenerin Like'
      description: 'Worms in this group have mutations in ion channels.'
    dop:
      name: 'Dopamine receptor'
      description: 'Worms in this group have mutations in one of their dopamine receptors. Some of their cells may not respond normally to the neurotransmitter dopamine.'
    egl:
      name: 'Egg Laying defective'
      description: 'Worms in this group have previously been observed to have defects in egg laying. They may lay more or fewer eggs than normal.'
    flp:
      name: 'FMRF-Like Peptide'
      description: 'Neurons use molecules called neuropeptides to communicate with each other. Worms in this group have mutations in a gene that codes for a kind of neuropeptide.'
    gpa:
      name: 'G Protein, Alpha subunit'
      description: 'Worms in this group have mutations in one of their G proteins. In humans, G proteins work with G protein coupled receptors (GPCRs) affecting our senses of vision and smell and the regulation of mood and behaviour.'
    gpb:
      name: 'G Protein, Beta subunit'
      description: 'Worms in this group have mutations in one of their G proteins. In humans, G proteins work with G protein coupled receptors (GPCRs) affecting our senses of vision and smell and the regulation of mood and behaviour.'
    gpc:
      name: 'G Protein, Gamma subunit'
      description: 'Worms in this group have mutations in one of their G proteins. In humans, G proteins work with G protein coupled receptors (GPCRs) affecting our senses of vision and smell and the regulation of mood and behaviour.'
    ins:
      name: 'Insulin related'
      description: 'Worms make insulin-like molecules that function in communications between neurons. These worms have mutations disrupting one of the genes coding for an insulin-like molecule.'
    lev:
      name: 'Levamisole resistant'
      description: 'Normal worms stop moving when treated with levamisole. Worms in this class are resistant to levamisole.'
    mec:
      name: 'Mechanosensory abnormality'
      description: 'Worms in this group have a mutation in a gene that affects their sense of touch.'
    n2:
      name: 'N2'
      description: 'This is the “wild type” reference strain. First isolated in Bristol in 1951, it is now grown (and frozen!) in many labs all around the world.'
    nca:
      name: 'Novel Channel type/putative Nematode Calcium channel'
      description: 'Worms in this class have mutations in genes that are thought to code for ion channels.'
    nlp:
      name: 'Neuropeptide-Like Protein'
      description: 'Neuropeptides are a class of molecule that neurons use to communicate. Worms in this group have mutations in a gene that may code for a neuropeptide based on its gene sequence.'
    npr:
      name: 'Neuropeptide Receptor family'
      description: 'Worms in this class have mutations that affect one of their neuropeptide receptors. These receptors are required to respond to the neuropeptides that neurons use to communicate.'
    ocr:
      name: 'Osm-9 and Capsaicin receptor-Related'
      description: 'Worms in this group have mutations in one kind of ion channel. Channels in this family are often involved in sensation.'
    osm:
      name: 'Osmotic avoidance abnormal'
      description: 'High osmolarity solutions have lots of molecules dissolved in them. Worms in this group have mutations affecting their ability to sense and avoid solutions with high osmolarity.'
    lon:
      name: 'Long'
      description: 'Worms in this group have mutations that make them grow longer than normal.'
    ser:
      name: 'Serotonin/octopamine receptor family'
      description: 'Serotonin is a neurotransmitter that neurons use to communicate. Worms in this class have mutations in serotonin receptors so they may have defects in neural signaling.'
    sma:
      name: 'Small'
      description: 'Worms in this group have mutations in genes that make them smaller than normal.'
    snf:
      name: 'Sodium: Neurotransmitter symporter Family'
      description: 'Worms in this class have mutations in genes that code for proteins that recycle neurotransmitters at synapses, the points where neurons connect to each other for local chemical communication.'
    syg:
      name: 'Synaptogenesis abnormal'
      description: 'Worms in this group have mutations in genes involved in making connections between neurons during development.'
    trp:
      name: 'Transient receptor potential channel family'
      description: 'Worms in this group have mutations in genes that code for ion channels that may play a role in different kinds of sensation.'
    tyra:
      name: 'Tyramine receptor'
      description: 'Tyramine receptors are proteins that sense the neurotransmitter tyramine. Worms in this group have mutations in tyramine receptors.'
    unc:
      name: 'Uncoordinated'
      description: 'Worms in this class have mutations that change how they crawl. There are many kinds of uncoordinated worms including kinkers, coilers, shrinkers, and shakers. The defects can be subtle or severe.'
    notAvailable:
      name: "Unspecified worm type"
      description: "This worm's genetic abnormality is not specified."

  tutorial:
    welcome:
      header: "Welcome to the Worm Watch Lab tutorial!"
      details: "Your job is to watch a short video and watch out for when a worm lays an egg. In this tutorial we're going to show you an example of this happening."
    overview:
      header: "The Task"
      details: "All you have to do is tap the \"Z\" key on your computer when you see a worm lay an egg. That's it!"
    begin:
      header: "Let's begin..."
      details: "Click the banner box below to begin!"
    playing:
      header: "Video Playing"
      details: "The video is now playing. You can see the worm wiggling around a bit."
    firstEggLaying:
      header: "Egg Layed"
      details: """
        This is what an egg-laying event looks like. It appears as a small bulge from
        the middle of a worm.<br><br>

        The eggs will only ever appear from the middle of a worm near the red dot.<br><br>

        If there are multiple eggs, please mark an event (using the "Z" key) for each egg.
      """
    eggsPlanation:
      header: "Egg Marking"
      details: """
        Sometimes there are multiple eggs. If you see more than one egg, press the "Z" key for each egg.<br><br>

        You will occasionally see videos where some eggs have been laid before the video starts.
        You don't have to mark these!
      """
    video:
      header: "Video Controls"
      details: """
        Click the video to start/stop it at any time. Control the time of the video by
        clicking on the progress bar.<br><br>

        You can remove a mark by clicking the little "x" next to the marked time on
        the right.<br><br>
      """
    finish:
      header: "Done!"
      details: "That's it! Click \"Finished\" when the video is over to watch more worms!"
