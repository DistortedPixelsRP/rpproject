Locales['en'] = {
    ['document_deleted'] = "El documento ha sido ~g~eliminado~w~.",
    ['document_delete_failed'] = "Ha ocurrido un ~r~error~w~ a la hora de eliminar.",
    ['copy_from_player'] = "Has ~g~recibido~w~ una copia del documento.",
    ['from_copied_player'] = "Formulario ~g~copiado~w~ de un jugador.",
    ['could_not_copy_form_player'] = "~r~No~w~ se pudo copiar el formulario al jugador.",
    ['document_options'] = "Opciones de Documentos",
    ['public_documents'] = "Documentos Públicos",
    ['job_documents'] = "Documentos de Trabajo",
    ['saved_documents'] = "Documentos Guardados",
    ['close_bt'] = "Cerrar",
    ['no_player_found'] = "No se encontraron jugadores.",
    ['go_back'] = "Volver",
    ['view_bt'] = "Ver",
    ['show_bt'] = "Mostrar",
    ['give_copy'] = "Dar copia",
    ['delete_bt'] = "Borrar",
    ['yes_delete'] = "Si, borrar",
}

Config.Documents['en'] = {
      ["public"] = {
        {
          headerTitle = "FORMULARIO DE AFIRMACIÓN",
          headerSubtitle = "Formulario de afirmación ciudadana.",
          elements = {
            { label = "CONTENIDO DE AFIRMACIÓN", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "DECLARACIÓN DEL TESTIGO",
          headerSubtitle = "Testimonio oficial de testigos.",
          elements = {
            { label = "FECHA DE OCURRENCIA", type = "input", value = "", can_be_emtpy = false },
            { label = "CONTENIDO DE TESTIMONIO", type = "textarea", value = "", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "DECLARACIÓN DE DEUDA HACIA LOS CIUDADANOS",
          headerSubtitle = "Declaración oficial de deudas a otros ciudadanos.",
          elements = {
            { label = "NOMBRE DEL ACREDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "APELLIDO DEL ACREDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "CANTIDAD PRESTADA", type = "input", value = "", can_be_empty = false },
            { label = "FECHA DE VENCIMIENTO", type = "input", value = "", can_be_empty = false },
            { label = "OTRA INFORMACIÓN", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
        {
          headerTitle = "DECLARACIÓN DE LIQUIDACIÓN DE DEUDA",
          headerSubtitle = "Declaración de liquidación de deudas de otros ciudadanos.",
          elements = {
            { label = "NOMBRE DEL DEUDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "APELLIDO DEL DEUDOR", type = "input", value = "", can_be_emtpy = false },
            { label = "MONTO DEUDA", type = "input", value = "", can_be_empty = false },
            { label = "OTRA INFORMACIÓN", type = "textarea", value = "POR LA PRESENTE DECLARO QUE EL CIUDADANO ANTERIOR HA COMPLETADO UN PAGO CON LA CANTIDAD DE DEUDA ANTERIOR", can_be_emtpy = false, can_be_edited = false },
          }
        }
      },
      ["police"] = {
        {
          headerTitle = "PERMISO ESPECIAL DE ESTACIONAMIENTO",
          headerSubtitle = "Permiso especial de estacionamiento sin límite.",
          elements = {
            { label = "NOMBRE DEL TITULAR", type = "input", value = "", can_be_emtpy = false },
            { label = "APELLIDO DEL TITULAR", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO HASTA", type = "input", value = "", can_be_empty = false },
            { label = "INFORMACIÓN", type = "textarea", value = "EL CIUDADANO ANTERIOR HA OTORGADO UN PERMISO DE ESTACIONAMIENTO ILIMITADO EN CADA ZONA DE LA CIUDAD Y ES VÁLIDO HASTA LA FECHA DE VENCIMIENTO ESTABLECIDA.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "PERMISO DE ARMAS",
          headerSubtitle = "Permiso especial para armas provisto por la policía.",
          elements = {
            { label = "NOMBRE DEL TITULAR", type = "input", value = "", can_be_emtpy = false },
            { label = "APELLIDO DEL TITULAR", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO HASTA", type = "input", value = "", can_be_empty = false },
            { label = "INFORMACIÓN", type = "textarea", value = "EL CIUDADANO ANTERIOR SE PERMITE Y OTORGA UN PERMISO DE ARMA QUE SERÁ VÁLIDO HASTA LA FECHA DE VENCIMIENTO ESTABLECIDA.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "REGISTRO PENAL CIUDADANO LIMPIO",
          headerSubtitle = "Oficial limpio, de propósito general, antecedentes penales ciudadanos.",
          elements = {
            { label = "NOMBRE DEL CIUDADANO", type = "input", value = "", can_be_emtpy = false },
            { label = "APELLIDO DEL CIUDADANO", type = "input", value = "", can_be_emtpy = false },
            { label = "VÁLIDO HASTA", type = "input", value = "", can_be_empty = false },
            { label = "ANTECEDENTE", type = "textarea", value = "LA POLICÍA DECLARA QUE EL CIUDADANO ANTERIOR TIENE UN ANTEDECENTE CRIMINAL LIMPIO. ESTE RESULTADO ES GENERADO POR LOS DATOS PRESENTADOS EN EL SISTEMA DE REGISTRO PENAL POR LA FECHA DE FIRMA DEL DOCUMENTO.", can_be_emtpy = false, can_be_edited = false },
          }         
        },
        {
          headerTitle = "Declaración de antecedentes penales",
          headerSubtitle = "",
          elements = {
            { label = "Nombre del ciudadano", type = "input", value = "", can_be_emtpy = false },
            { label = "Apellido del ciudadano", type = "input", value = "", can_be_emtpy = false },
            { label = "Válido hasta", type = "input", value = "", can_be_empty = false },
            { label = "Declaración", type = "textarea", value = "La policia declara que el ciudadano esta limpio de antecedentes penales hasta la fecha segun nuestra base de datos.", can_be_emtpy = false, can_be_edited = false },
          }
        }
      },
      ["ambulance"] = {
        {
          headerTitle = "MEDICAL REPORT - PATHOLOGY",
          headerSubtitle = "Official medical report provided by a pathologist.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED HEALTHY WITH NO DETECTED LONGTERM CONDITIONS. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "MEDICAL REPORT - PSYCHOLOGY",
          headerSubtitle = "Official medical report provided by a psychologist.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED MENTALLY HEALTHY BY THE LOWEST APPROVED PSYCHOLOGY STANDARDS. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "MEDICAL REPORT - EYE SPECIALIST",
          headerSubtitle = "Official medical report provided by an eye specialist.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN WAS TESTED BY A HEALTHCARE OFFICIAL AND DETERMINED WITH A HEALTHY AND ACCURATE EYESIGHT. THIS REPORT IS VALID UNTIL THE AFOREMENTIONED EXPIRATION DATE.", can_be_emtpy = false },
          }
        },
        {
          headerTitle = "MARIJUANA USE PERMIT",
          headerSubtitle = "Official medical marijuana usage permit for citizens.",
          elements = {
            { label = "INSURED FIRSTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "INSURED LASTNAME", type = "input", value = "", can_be_emtpy = false },
            { label = "VALID UNTIL", type = "input", value = "", can_be_empty = false },
            { label = "MEDICAL NOTES", type = "textarea", value = "THE AFOREMENTIONED INSURED CITIZEN IS GRANTED, AFTER BEING THOROUGHLY EXAMINED BY A HEALTHCARE SPECIALIST, MARIJUANA USAGE PERMIT DUE TO UNDISCLOSED MEDICAL REASONS. THE LEGAL AND PERMITTED AMOUNT A CITIZEN CAN HOLD CAN NOT BE MORE THAN 100grams.", can_be_emtpy = false, can_be_edited = false },
          }
        },
      },
      ["mechanic"] = {
        {
          headerTitle = "DECLARACIÓN DE SEGUROS DE VEHÍCULOS",
          headerSubtitle = "Declaración oficial de seguros de vehículos a otros ciudadanos.",
          elements = {
            { label = "NUMERO DE PATENTE", type = "input", value = "", can_be_emtpy = false },
            { label = "NOMBRE CIUDADANO", type = "input", value = "", can_be_emtpy = false },
            { label = "PRECIO ACORDADO", type = "input", value = "", can_be_empty = false },
            { label = "OTRA INFORMACIÓN", type = "textarea", value = "", can_be_emtpy = true },
          }
        },
      },
	  ["lifenews"] = {
        {
          headerTitle = "CONTRATO LIFENEWS",
          headerSubtitle = "Contrato de la empresa LifeNews.",
          elements = {
            { label = "NOMBRE Y APELLIDO DEL CONTRATADO", type = "input", value = "", can_be_emtpy = false },
            { label = "CONTRATO VALIDO HASTA", type = "input", value = "00/00/0000", can_be_empty = false },
            { label = "INFORMACIÓN", type = "textarea", value = "LA EMPRESA contrata los servicios de EL TRABAJADOR para que desempeñe, principalmente,  la función de................. durante la valides de este contrato", can_be_emtpy = true },
          }
        },
      },
  }
