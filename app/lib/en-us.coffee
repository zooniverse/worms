module.exports =

  navigation:
    home: "Home"
    classify: "Classify"
    science: "Science"
    team: "Team"
    partners: "Partners"
    discuss: "Discuss"
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
      favorite: 'Favorite'
      discuss: 'Discuss'
      next: 'Next worm'
      help: 'Help'

    messages:
      startPrompt: "Click to start"
      onStart: "Press \"Z\" if you see the worm lay an egg"
      onRemoveMark: "You removed a mark at $removedTime"

    stats:
      player: "Player: $name"
      score: "Score: $amount"
      signInPrompt: "Sign in to play"
      eggAt: "Egg at:"
      firstSpotter: "First spotter!"
      spotterAward: "You are the first person to see this worm! You get a 200 point spotter award"

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
          x: "X - Start the video / Move to next video"
          z: "Z - Mark an egg-laying event"

  profilePage:
    wormsObserved: "Worms Observed: $count"    
    score: "Score: $score"
    notLoggedIn: "Login to view profile"


  partnersPage:
    header: "Partner Organisations"
    content: """
      <h3>MRC Laboratory of Molecular Biology</h3>
      <p>The MRC Laboratory of Molecular Biology (LMB) is a world-class research laboratory, dedicated to understanding important biological processes at the molecular level - with the goal of using this knowledge to tackle major problems in human health and disease. The LMB is one of the birthplaces of modern molecular biology. Many techniques were pioneered at the laboratory, including DNA sequencing, methods for determining the three-dimensional structure of proteins and the development of monoclonal antibodies.</p>
      <p>Over the years, the work of LMB scientists has attracted nine Nobel prizes, shared between 13 LMB scientists, dozens of Royal Society awards and numerous other scientific honours.</p>

      <h3>Medical Research Foundation</h3>
      <p>The Medical Research Foundation is the Medical Research Council's independently managed charity. It receives funds from the giving public to support medical research, training, public engagement and dissemination of knowledge.</p>
      <p>Since it was first established in 1920, the MRC has been able to accept charitable bequests, endowments and donations from the public to contribute towards the costs of the research that it undertakes. The MRC registered these charitable funds with the Charity Commission in the late 1960's and its charity - the Medical Research Foundation - has been successfully supporting medical research for over 80 years.</p>
    """

  sciencePage:
    header: "Our small distant cousins"
    content: """
      <p>We watch movies of the nematode worm C. elegans to understand how the brain works and how genes affect behaviour. The idea is that if a gene is involved in a visible behaviour, then mutations that break that gene might lead to detectable behavioural changes. The type of change gives us a hint about what the affected gene might be doing. Although it is small and has far fewer cells than we do, C. elegans has almost as many genes and because we share a common ancestor even with worms, many of them are closely related to human genes. This presents us with the opportunity to study the function of genes that are important for human brain function in an animal that is easier to handle, great for microscopy and genetics, and has a generation time of only a few days.</p>

      <h2>The Importance of Egg Laying</h1>
      <p>Egg laying in C. elegans requires the proper functioning of a neural circuit to activate the muscles that open the vulva to expel eggs. This circuit is modulated by a neurotransmitter called serotonin; the same molecule that affects mood in humans. Antidepressants like prozac work by stimulating serotonergic signaling in humans. They also work in worms and they stimulate egg laying! If we observe a mutant that lays more or fewer eggs than normal, this is a hint that something has gone wrong in the egg laying neural circuit or muscles and this can have far reaching implications, maybe even teaching us something about genes involved in depression in humans. The challenge is that there are thousands of genes without a known function and screening for worms with egg laying defects is time consuming. That's why we need your help!</p>

      <h2>Worm Tracking</h2>
      <p>We have built tracking microscopes to record video of crawling worms. A USB microscope is mounted on a motorised stage connected to a computer. When the worm moves, the computer analyses the changing image and commands the stage to move to re-centre the worm in the field of view. Because the trackers work without supervision, we can run eight of them in parallel to collect a lot of movies. If you'd like to learn more about worm tracking (or even build a tracker yourself!), we have a parts list and instructions on our <a href="http://www.mrc-lmb.cam.ac.uk/wormtracker/">tracking website</a></p>
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
      name: 'abnormal CATecholamine distribution'
      description: 'Worms in this group have mutations in genes that affect the production of some types of neurotransmitters, like dopamine.'
    daf:
      name: 'abnormal DAuer Formation'
      description: 'When stressed early in life, normal worms are able to develop into a long-lived form called a dauer larva. Worms in this group have defects in dauer formation..'
    del:
      name: 'DEgenerin Like'
      description: 'Worms in this group have mutations in ion channels.'
    dop:
      name: 'DOPamine receptor'
      description: 'Worms in this group have mutations in one of their dopamine receptors. Some of their cells may not respond normally to the neurotransmitter dopamine.'
    egl:
      name: 'EGg Laying defective'
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
      name: 'INSulin related'
      description: 'Worms make insulin-like molecules that function in communications between neurons. These worms have mutations disrupting one of the genes coding for an insulin-like molecule.'
    lev:
      name: 'LEVamisole resistant'
      description: 'Normal worms stop moving when treated with levamisole. Worms in this class are resistant to levamisole.'
    mec:
      name: 'MEChanosensory abnormality'
      description: 'Worms in this group have a mutation in a gene that affects their sense of touch.'
    n2:
      name: 'N2'
      description: 'This is the “wild type” reference strain. First isolated in Bristol in 1951, it is now grown (and frozen!) in many labs all around the world.'
    nca:
      name: 'Novel Channel type/putative Nematode CAlcium channel'
      description: 'Worms in this class have mutations in genes that are thought to code for ion channels.'
    nlp:
      name: 'Neuropeptide-Like Protein'
      description: 'Neuropeptides are a class of molecule that neurons use to communicate. Worms in this group have mutations in a gene that may code for a neuropeptide based on its gene sequence.'
    npr:
      name: 'NeuroPeptide Receptor family'
      description: 'Worms in this class have mutations that affect one of their neuropeptide receptors. These receptors are required to respond to the neuropeptides that neurons use to communicate.'
    ocr:
      name: 'Osm-9 and Capsaicin receptor-Related'
      description: 'Worms in this group have mutations in one kind of ion channel. Channels in this family are often involved in sensation.'
    osm:
      name: 'OSMotic avoidance abnormal'
      description: 'High osmolarity solutions have lots of molecules dissolved in them. Worms in this group have mutations affecting their ability to sense and avoid solutions with high osmolarity.'
    lon:
      name: 'LONg'
      description: 'Worms in this group have mutations that make them grow longer than normal.'
    ser:
      name: 'SERotonin/octopamine receptor family'
      description: 'Serotonin is a neurotransmitter that neurons use to communicate. Worms in this class have mutations in serotonin receptors so they may have defects in neural signaling.'
    sma:
      name: 'SMAll'
      description: 'Worms in this group have mutations in genes that make them smaller than normal.'
    snf:
      name: 'Sodium: Neurotransmitter symporter Family'
      description: 'Worms in this class have mutations in genes that code for proteins that recycle neurotransmitters at synapses, the points where neurons connect to each other for local chemical communication.'
    syg:
      name: 'SYnaptoGenesis abnormal'
      description: 'Worms in this group have mutations in genes involved in making connections between neurons during development.'
    trp:
      name: 'Transient receptor potential channel family'
      description: 'Worms in this group have mutations in genes that code for ion channels that may play a role in different kinds of sensation.'
    tyra:
      name: 'TYRAmine receptor'
      description: 'Tyramine receptors are proteins that sense the neurotransmitter tyramine. Worms in this group have mutations in tyramine receptors.'
    unc:
      name: 'UNCoordinated'
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
