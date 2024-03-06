Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1886214F7F
	for <linux-hwmon@vger.kernel.org>; Wed,  6 Mar 2024 09:50:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709718616; cv=none; b=hrPYi6aBHHzGM2dlmPSlUBJ8gvteW3iHen/jY5lgRqsbfEj30Q0D4MCQIJQPLLHVczHoIXR8DYazNm+SfPPiibhXb/04DRb0YGe8pjcxsrPQpO8V0vb97UdQCotCIRaV0oETWpdiZk0Un/7ms6ySHpT2dCz1rCO+Gd14Iw91Vu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709718616; c=relaxed/simple;
	bh=5wTDv8Pow3ls0hAeMHjkJghWq0FXCqANDCJJgNSwvho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ceANhjdDOjCdFAmlHkLewrXLlO88TEk28DGKWqlJo3yaV7dv0VKXJGk+sBvV9IxtVFrXhChJywiCxjNxddFIwVPsHhnnAgqwgTbgUbaWTLp5v5yPpFPeFHi4pOJFGifK68OLPdFX9MlaF9vw7x/gzvNQ7lLlKh/2769URlipoT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=bXPN6EEK; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="bXPN6EEK"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-29a6dcfdd30so534483a91.0
        for <linux-hwmon@vger.kernel.org>; Wed, 06 Mar 2024 01:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1709718614; x=1710323414; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5wTDv8Pow3ls0hAeMHjkJghWq0FXCqANDCJJgNSwvho=;
        b=bXPN6EEK8ROtqPXnYOisP9OZv3wXjLA9VoezLbW3CpaUU1dDVxypTELbSobzh3ISeO
         xeeF+K748SPIMCXb59dhOMK8AOcrwAYrBhvPq0myPnega+hV0+Ig/sQcg8N030py06sk
         uE049MOvk3W3SPtXR4IO/0+Hj631mWd8R1z3r/9ZfaUaNRgiXWbf+jjzAi09jCuQSX9k
         4fIyoX1knONzgrM09k7oeU+5dvnWApdAWQjeiDOfqEOPsM2ZwZXs4XiEcPdbj0TeJn+i
         fGZguCMDj+GG181gxMU3Sznje5Qmiz/t4XbK975eZUMhtA8ATFIqV/rRnjsGnaLNvqPQ
         db2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709718614; x=1710323414;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5wTDv8Pow3ls0hAeMHjkJghWq0FXCqANDCJJgNSwvho=;
        b=R14Tfp1byQ9HnfS259r3EWnxuyO3mM2wnZVZ9U6tbizk0KiO9mmcZD1E3ZA8bTL3UD
         QXWLRGw7EurcsiAq8uNHu5zEEypuSU/mnQbVJ5tpJHuS1zdTs3wJWcVeFdNPSRAmAqTA
         KjsrctP5c5r1RgFjnQy8aZBSklXQkV9KwmAxW0BrtHDTVjNV7Y1rS9g5ACOd3sZ7+8Yr
         uAwAdQZXFs8qkVtDOhF2rMCTB2Hb59jqMXTSqRzJFoUu6halJaGWRP1t6Eh0yRrpbLSv
         CvmT5GQ07kLdOLgDGnRDrom2PRqLHCM+rK2Dow5uNWjsxruWNNYcBectTh52PfCRz8Ge
         GWQw==
X-Forwarded-Encrypted: i=1; AJvYcCXxMqJK3uYWoYOGjSH6oIk7fFJyrhrwBSQHy6qOeqqy/WwuZVwnjuI7pqDbPTgfy5asQ1SAfCmjTeZEkM/BM/5nFhxpo3lwiSMqeOE=
X-Gm-Message-State: AOJu0YxxZDwSjK+fnkdrFXYP2KZH3zps9lJQ5YKmsBgFLzD5jHqpze4c
	4Jdr7DBnfldNnoBXVRI+yfB/u5Gxgp5xNIO+rOAR5bHDFD3VI+KTWe8AxjMBgru2BXlT/JvyFlz
	pePf7A+6kZsrmr2JVeLNPsX7qeX+UGysf1KJYnA==
X-Google-Smtp-Source: AGHT+IEe5ARYEUNZCsr+iHrFPzLLIKN3FTqKMUPA5r/pRjcydibLKmQbYN0Ni7yeDM2vxSQwE6cGRdoCFy2gruuS/H0=
X-Received: by 2002:a17:90a:f490:b0:29a:6b5c:33ba with SMTP id
 bx16-20020a17090af49000b0029a6b5c33bamr12644943pjb.5.1709718614426; Wed, 06
 Mar 2024 01:50:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240305210747.1377506-1-naresh.solanki@9elements.com> <a32a2655-7561-4339-8521-bc2558e0bdb1@linaro.org>
In-Reply-To: <a32a2655-7561-4339-8521-bc2558e0bdb1@linaro.org>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 6 Mar 2024 15:20:02 +0530
Message-ID: <CABqG17hYK8MFMPVNXxZ6JT4TW00PPt48q1qZBzS=gJrpC--iTg@mail.gmail.com>
Subject: Re: [PATCH v3] dt-bindings: hwmon: tda38640: Add interrupt &
 regulator properties
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	mazziesaccount@gmail.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof,


On Wed, 6 Mar 2024 at 12:44, Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 05/03/2024 22:07, Naresh Solanki wrote:
> > Add properties for interrupt & regulator.
> > Also update example.
>
> Nothing improved.
Yes, Just aligned the regulator node name in this revision.
I missed aligning the commit message.

I'll fix in next revision & update commit message as:

tda38640 has a single regulator output along with
CAT_FAULT# pin to report internal events.
Hence add properties for regulator & interrupt.

Let me know if any others changes needed.

Regards,
Naresh

>
> Broken record. You got the same comment 3rd or 4th time!
>
> NAK
>
> Best regards,
> Krzysztof
>
