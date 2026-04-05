Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FEDD40DFB7
	for <linux-hwmon@vger.kernel.org>; Sun,  5 Apr 2026 07:57:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775375824; cv=pass; b=Oa3oayzNfaz06yhpi7nS6WJCdfzqxVzweV7ktetHKZIvacxdctJf1X0NNDs8Ak1kF5Wnp7xVqkuqTWJop7bLxwOQ+lA10K+tiCJmxpwpvVXY2p0rRaLgWP7faCpf8DT7r5ZXmxoZb1AWwvTANKSV4th4kiOjcDxTxKsZCEormrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775375824; c=relaxed/simple;
	bh=v2AemCJXh2g6jKN5k/h4VeRyD5TrLOXfx2m6bakC2HE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SCFFZfJY4T5MFjuXmndWb8SCQk9uYlUBLiMdmWTOBILzvGqypQfgycEVJoHicbsJi9FPf3/r1Q0kN3WoKGros8fDOLgIK9J0L9g9SvFwLbHWRwbCmT0TDOEUqi5OGWRPRKAkDliV6G6pH21fJQt4O/6QITkW9JM72DlG5OlaXhg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XTa3uc9v; arc=pass smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XTa3uc9v"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-59e4989dacdso3458737e87.1
        for <linux-hwmon@vger.kernel.org>; Sun, 05 Apr 2026 00:57:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775375821; cv=none;
        d=google.com; s=arc-20240605;
        b=YQMmlQeXmjrByKpX0B9/uE42lQAEoZSd6vCphIUhRO0P0eNHhRhoDDG7wF9iMpNN2a
         giAOHwNA1IRiMtrsHLGTRbBu/2+KAzw72Euq6RhCQKAjTnJE/UIiSn1v47vg5nz+eP5N
         f70+wOwwmsEv86nb8yjcgvhLl4vkwj5Q5dkFyRZZ68cTNG4SsyCu0z7yH4lJkAdhXfcr
         M8HHe2/zi5QrvhCRLlCwxP+y6PNEQFYLE5p6bBlujOIvBBPAC0yrVvN2EdGKWoXuBaYi
         y9LnQPTExU5skUdKkFWZ9rWAApdnp4di5mTHg8UMV/GcjYVp+yD8Ly+eF3TZFb0Vcawd
         dSEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ZYdxMqlKaHCpmRjoXMMB634HpWZheaFAq9MPMung4LQ=;
        fh=CcPw2nJFL4WEZc5RE7LyJAFiIr/yR3/Ii4x60eS8R3s=;
        b=OsRhcy7xqgO3sjkAoXJlgxjwAIL//IpQmPjiX0F7MKC5nIgO/4diR6rQg/v5EQKSSu
         A91QeN7OPNYnKkhHCP1SqIs26t5uF7bO+D3CjR2YhghynAd53gyB2FyP1Io1tDNb9FqX
         ie92Y8yQb+R5ASImIoQhbUVN89U0ZCYHOhV3JTukPRuLdfvH/+4F3T2+uqGAXGJT3upX
         r+Y+xFo8ZAyjUCshuUDw01wb8M7n5lMYHnNeghYMFTJnTAnb9YLaXsJbV7SjjiCJGYSN
         sPEIZ6J6oGlB4AYc1tXfmP5Ff1nXXJMX/ppmre9m5Vt0yUDXdFoLXptqP04000FGyKpi
         U7eg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775375821; x=1775980621; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZYdxMqlKaHCpmRjoXMMB634HpWZheaFAq9MPMung4LQ=;
        b=XTa3uc9vtBhyRRHMP0YhtFVT4HbngcOU5w8jCZrTZnZK95Jz14kXcqfzn61nZw2mqd
         1U/MnV9q89R/mwM7k7q117bTfsxE7mleojijhFZn1y5tTCa7B5ljMGT1wPScWWh0bQPS
         w7rfy1Z2C0nSY4U8AiA8e/vyr+j2pZhII98rlHkLbufGdg0GjKuDYs4iTxg74RuPh58U
         pSXerFs68yUPiWtIE0SF8lJpBM+PymSQprz1+L2GpBkiNGZhWtyekbvdnVZp+MSynD4q
         g/HTEtSp9XqYyWVBMwX5sRQkubrwo04VM2KYcIcqcRdFtf0HfV0tPBwZp4hXOCiUxDJh
         6TjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775375821; x=1775980621;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZYdxMqlKaHCpmRjoXMMB634HpWZheaFAq9MPMung4LQ=;
        b=mShqMZxGgdOamue5IubzLFHrGRCplybj0eAUIFtsmeVgx31GpYdIXa/A+Cjy2uq2CH
         k4Pb7yuuy0esku9HwJ/ABQLkLOoVzwlfpI6jc9T59sWRKIzelZH3J9uuMNd7/l29DDvw
         Zso06cespRNngkl/sgXlpdKQFALn0X9GcQ+fLDvFws7RmjSNk/xa6l36/tS4p5Z666nl
         cdkjvCN3juXzTQ0bkOD3VBf/JTT2nELN76qWecse8Ol/14behL6vcyu75JO42dChyLDH
         xw2V08i/6YI5uO4qhlp6A1+5MMETRQq2ae9pAPZtLYBgflMRa8IzMJ4CLdPtJbTFHhV3
         UR0w==
X-Forwarded-Encrypted: i=1; AJvYcCVwWTsg4SZSqqc1wrViRXKINZ4khpPrKiAC9L+a7CQTDJMY88htvCa/0N/nB82AO8KUWkPY+nZVjEYTQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKSsNsyHlX6zQA3bZWyk5GyL3rEKCqmh31N1nZEXiouRlUn+eF
	oYjaEIt78XZtqWnP5COmAllwKVNbmDzJNhgGzg8eZUBKeg3Thy2JkbCT1M9KJcbpWtfvLDsEnNp
	O77h7E14K8MbmG4MGzD3Y7OGmc13eFQ5fkVMou/zfCBTz
X-Gm-Gg: AeBDiesNUP3GtHd2vn0KJk3MLMHVIIS8JzgBkCOa9J8Le4kv5dHMwm/jCbWIQm07JVp
	/LvM4D24n/aQBK+/qTEvAlAMHzxfMYhY+DHXMuE8c+w2FOCQ1by80RWPog/A4wsY3AhVk+5AAKf
	21zQuQv92i8ZRnGQfkTMJV2yWInG0l2TlSN5mHHie+mGjJSGBXXD1cntfZB28YPZ+7+9G24KHAT
	3t/u7Rx1M15HLIgF/9Hh92SLSdaFAxSCzgvp66RgOD+Xm4ZUegZx3FilOf3luSBj1zn4wVJNIzS
	NtkXqaH6pt9rbdAy
X-Received: by 2002:a05:6512:3f02:b0:5a2:ad98:3685 with SMTP id
 2adb3069b0e04-5a337588a95mr2616731e87.35.1775375821181; Sun, 05 Apr 2026
 00:57:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260404164339.119023-1-sergiomelas@gmail.com> <af1725c3-fb25-493a-819b-b25c375c058b@roeck-us.net>
In-Reply-To: <af1725c3-fb25-493a-819b-b25c375c058b@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Sun, 5 Apr 2026 09:56:49 +0200
X-Gm-Features: AQROBzAdqf7gO_cCq5KnSJWNhuFTLCACdrjHVfjjPOC18dM_YkPDl97UlsWlmvg
Message-ID: <CAP8e=sLeqBMbZSN33DB4F6EP=G+uZLkJyWG43B=B_ws=cbg7hg@mail.gmail.com>
Subject: Re: [PATCH v14] Subject: [PATCH v14] hwmon: (yogafan) Extend support
 to more Lenovo consumer models
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

Please accept my apologies for the confusion regarding the version
numbering and the
inappropriate comments within the code. I am still learning the
nuances of the upstream
process and I appreciate your patience and guidance a lot.

To clarify the situation:

1- Do not drop the original series: The initial yogafan driver is
stable and should
remain accepted. This new patch is intended as a follow-up expansion to increase
hardware coverage and refactor the internal physics for the next merge window.

2- Version numbering: I mistakenly increased the sequence number from
the original series
due to my inexperience with the upstream submission process. I realize
now that my dexterity
with these procedures is still developing; since the first part of the
driver is already accepted,
I understand this expansion should have been treated as a fresh,
separate patch (v1) rather
than a continuation of the previous version count.

3- The code comment: I am deeply sorry for the unprofessional comment
in the source code.
It was a misguided internal note used to track my progress on your
previous feedback regarding
'ghost fans' and attribute collisions, i forgot to remove it and this
is unacceptable. I now realize that
referencing a maintainer in this way is completely inappropriate for
the kernel source.
I am truly embarrassed by this oversight and will ensure such personal
notes never make it into
a submission again. I will remove it immediately.

My Plan:
I would like to keep the original driver in the hwmon-next repository.
I will stop the current V14 sequence.
After the merge window, I will resubmit this expansion as a fresh v1
'Part 2' patch, properly formatted
and with all technical/style corrections addressed.

Does this align with the  procedure you want , or would you prefer a
different approach?

Thank you for the guidance.

Best regards,

Sergio Melas
