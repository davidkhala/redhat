function Setup {
    crc setup
}

function Start {
    crc start
}
if ($args.Count -gt 0) {
    Invoke-Expression ($args -join " ")
}