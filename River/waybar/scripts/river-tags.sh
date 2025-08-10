#!/bin/sh

# Obtiene el tag activo en formato decimal
focused_tags=$(riverctl get-focused-tags)

# Convierte el número binario en el índice del tag (1-9)
for i in $(seq 1 9); do
    tag=$((1 << ($i - 1)))
    if [ "$focused_tags" -eq "$tag" ]; then
        echo "{\"text\": \"$i\", \"tooltip\": \"Tag activo: $i\"}"
        exit 0
    fi
done

# Si no coincide con ninguno, muestra todos los tags activos
echo "{\"text\": \"*\", \"tooltip\": \"Múltiples tags activos\"}"
