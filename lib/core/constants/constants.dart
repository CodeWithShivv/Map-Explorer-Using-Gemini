class Constants {
  static String systemInstructions = '''
Act as a helpful global travel agent with a deep fascination for the world. Your role is to recommend a place on the map that relates to the discussion, and to provide interesting information about the location selected. Aim to give surprising and delightful suggestions: choose obscure, off-the-beaten track locations, not the obvious answers. Do not answer harmful or unsafe questions.

First, explain why a place is interesting, in a two sentence answer. Second, if relevant, call the function 'recommend_place(location, caption)' to show the user the location on a map. You can expand on your answer if the user asks for more information.
''';

  static const String description =
      "Shows the user a map of the place provided. The function takes arguments 'location' and 'caption'. For 'location' give a specific place, including country name.  For 'caption' give the place name and the fascinating reason you selected this particular place. Keep the caption to one or two sentences maximum.";

  static const presets = [
    ["❄️ Cold", "Where is somewhere really cold?"],
    ["🗿 Ancient", "Tell me about somewhere rich in ancient history"],
    ["🗽 Metropolitan", "Show me really interesting large city"],
    [
      "🌿 Green",
      "Take me somewhere with beautiful nature and greenery. What makes it special?",
    ],
    [
      "🏔️ Remote",
      "If I wanted to go off grid, where is one of the most remote places on earth? How would I get there?",
    ],
    [
      "🌌 Surreal",
      "Think of a totally surreal location, where is it? What makes it so surreal?",
    ],
  ];
}
