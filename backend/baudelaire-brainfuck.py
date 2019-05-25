import subprocess


def lambda_handler(event, context):
    """
    Run the brainfuck program baudelaire.b with the provided input and return
    a response containing the resulting output, in a format suitable for
    API Gateway integration.

    Input is taken from the query string parameter "input". It must be
    a sequence of ASCII characters terminated with a newline.

    The EsCo (Esoteric Combine) interpreter is used to run the program.
    """
    input = event["queryStringParameters"]["input"]
    completed_interpretation = subprocess.run(
        ["./esco", "--quiet", "--type", "bf", "baudelaire.b"],
        text=True,
        encoding="ascii",
        input=input,
        stdout=subprocess.PIPE)

    # Discard the first two lines of the output (they contain the message
    # "Enter a word and press Enter:" and then an empty line).
    trimmed_output = completed_interpretation.stdout.split("\n", 2)[2]

    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": trimmed_output,
    }
