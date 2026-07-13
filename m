Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB953336897
	for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 16:24:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783959857; cv=pass; b=Wyu0folHuCTUdni/vZpSnzpj7ywUGXpuP5HFNL4lESdmB6j3kej5h3o9OGsnwxenQt2PR2o7Qh76+wC+70+dQLrlnBTKfJjVJx8F3X6Pw7qQRnArYX/+r3zgP2yAihSESYpRzt8aIKjJjXxi+v82dHqNwSGOUoZyFYUqqbxhjEk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783959857; c=relaxed/simple;
	bh=ZEQgOof9NIG4nWczbdDkgmiipCAUqlv4TKuXzT2h/lo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A4NG6vZaZ3fABBbC9S9E+Vfqpr9hUeQS9MRuVYmJHxYmWfFcQuFthowBG5cFWXFdZQUIqPSTm3r9IibvAeVHYugeAlgYNJHaMYzE0agq/bdDFyobmazPg/Duqx5rGalUMz1AS+LgzZSypD+a6V/ihGf5J97ZinYWd4ZDowsb59o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=c8Xy3sze; arc=pass smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="c8Xy3sze"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5aeae771c49so3851873e87.3
        for <linux-hwmon@vger.kernel.org>; Mon, 13 Jul 2026 09:24:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783959854; cv=none;
        d=google.com; s=arc-20260327;
        b=GuWKC1eKr1inlycAqS/kNyNgjQm1O7DzJFj+LXKZQOVWAb149c26uWfHTPRb1wRLRu
         n9BwBeE3rlkWc0YBlm/njOFqxqBDJLVIhYMrYSbknB53ZbqUllzOHj0r1iMGlIrhCmR5
         vtAKSpxRsGGU7VXfkgFfDr9mYOX5l7/BBJXezsXcvh2nlFSwTCZNS/CNeO5FhMxGiFNc
         L5TuiDGjPGWwmIPJgjbgO1V0IvyvWJ0DVxg7vZvZv6O8X/1dzPbp3y2jOJ1buwS0cYCf
         gzNjJ3ybDK3yqC3mQAQO04HqRgRxNOMfAOFnH5Gm1CKSVtC0evssIqRPKRpcTKRRF+BB
         bN7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZEQgOof9NIG4nWczbdDkgmiipCAUqlv4TKuXzT2h/lo=;
        fh=k6wnWgoeBANTfg1j16+f++PW6LVd+rAqkUGlohFSQyQ=;
        b=ofwm7v3WEzEY1z/4bubCTbCyO+v3YCy6vhwqt1bP5D+oLkHH320hlzb2r1Fz1233i2
         3IhpWzlx1GWNScs/xlFUFpDxez5Dp5N8L336kpQBl7Vv9gYTywHn/z+KogranPb6mBbu
         eESqaAX9aInbtku374NaCyiMJE2KdJZVisPSdVw9GQpgjp2iclAg0VT7CXpmovaIDOCf
         Tec76etH+LLM/f3s062FGJ/mAFCr8vUeLRJ3fh1ylZndsqagj6GGFn4rUNL7lO/uZFeI
         xepotMoxMIrExIwFW3qoYyoGb+8uEYhD2Q50BmdyqBuAPrzUAsmEeD+MvLkQ2ad6x/eu
         SZrQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783959854; x=1784564654; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZEQgOof9NIG4nWczbdDkgmiipCAUqlv4TKuXzT2h/lo=;
        b=c8Xy3szes3K3bTc08VRIGf1lXNnxU/qWUvkicys7zA1nr5LiZJnCcD/gHu9Eo3/Z2a
         VuEA79boansV1iDECSiJRFM3xsbD8ahDCpxt0QPiNrT7OljuI+zsZJlQcl7Xd6foP3gd
         f9r+5wl0tpuZthhKt75pHFKpG6q2T11d4SJF8UAwYR19bkP6SpSzj+Abzyr8ykFBOdCj
         HLBk8EFkheatadkZbeU0d9AqxJAjWW/M4d51ZwQ7XB/GMKatK1p0N23vKACb9q1pU/5h
         iJa8eWJArAn5FkQGVAt8qs+WMnAx3UemJfyEfBYDRKWj0N3FotIPuRX+up7gEQmIrdEL
         P9GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783959854; x=1784564654;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZEQgOof9NIG4nWczbdDkgmiipCAUqlv4TKuXzT2h/lo=;
        b=mPMPMDcgQ+LoiKnCPhDJ5772bAzjCK5h4f63URMsQSpzI5l/m1YsHkjoy45CVMahML
         bEh4SVNUQSk7BkV0pCBk5SZeGjd35OfMHXnUJEtfQlMwEbDeo0/fdQ2UpO+em3fipYCp
         n0bozff7Eq9v2J0Ay1l6SEK7bA+vmDU7wteii4E6Hbv8eMqhImYNxdzpVbmrIMqnmONF
         r1Sy65oc8fWgLQhOtMSN/lORS6kJAG1Pg4GwTUXnahcNBlAoTwCZ+qI9AjnH0sFqPLg5
         bgrtRed4De8XyfAOSocUnbhncgR2MLTP6YPt9bjxiio0NxqERRAm2D7mBY0zOFq8kUHs
         73dw==
X-Forwarded-Encrypted: i=1; AHgh+RpLy+zfEsD71azkSqpCxVou2ummftIrdlOZVoP7FMwYOE47GDzx8jq9WlEE3rkbfuWbdLoGhUKp/efZUw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4gJ6ZQqaIbjYcUY+RnRoABaBQYDQviqGzlYqhYirftw5IbxAN
	34G2QsRP6qH9Z2uaC9wwHuz4xswt2efK84T4/qEAPdF7KFU6atGCSmTH7q8vaj75TVLbzqsG9XU
	E9GjnM8iIIlSFWE8Pemh/UtsmRPjp3tg=
X-Gm-Gg: AfdE7ck2xmy6O4gtXzkItcrawMa1MvyGNWe1t9bKBgGGIes+LulyAjLjTK4NjhquSRR
	VR/yWbjnsW9wfGOuSO8eC/gVxBAedcQ4Kk40fWwBgJ36Mrp9QlRa91iacqUEuedEGxqUhxkwWEa
	KbUzJkQSKo4jbQI7OJqLo+jCKBwLtA8OjtdX492t0aDQHWp2BSCPkCkg7G78wzKmxduatEkmE9Q
	ai4Hf+X5VfPom7G8ZEvvmdefC/BxHq9XXsmqwcP7Js+wZWHd/9TXjUWUcMD3G2yQ7r47LjUA/0I
	+WdzzLFYwSMEThWyeS3Cz/Ltpw2DYYgQke/FGQ==
X-Received: by 2002:a05:6512:61a9:b0:5b1:534c:5309 with SMTP id
 2adb3069b0e04-5b1534c53c0mr744873e87.17.1783959853561; Mon, 13 Jul 2026
 09:24:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709183500.13761-1-sarbajitsarkar16108@gmail.com> <69c9530e-66f5-4948-9cdb-04896c09fdf3@roeck-us.net>
In-Reply-To: <69c9530e-66f5-4948-9cdb-04896c09fdf3@roeck-us.net>
From: Sergio Melas <sergiomelas@gmail.com>
Date: Mon, 13 Jul 2026 18:24:01 +0200
X-Gm-Features: AUfX_my78Fifvh9xTWIZEj05RBI1S68h2_-Y182yKEIc5JM7aaXm3iFnBogyoc0
Message-ID: <CAP8e=sJbnGe7K=4v9DqRMEhWSM2pL6kk4xf3d7dp53L2rAe9wQ@mail.gmail.com>
Subject: Re: [PATCH] hwmon: (yogafan) Add support for Lenovo LOQ 15IAX9
To: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Sarbajit, Thanks for submitting the LOQ 15IAX9 support and mapping
the 8-bit dual-fan paths. It's a great addition to the driver. I will
rebase my local workspace to include your changes for the next
refactor. Best regards, Sergio Melas


On Fri, Jul 10, 2026 at 4:37=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Fri, Jul 10, 2026 at 12:05:00AM +0530, Sarbajit Sarkar wrote:
> > Add the Lenovo LOQ 15IAX9 product family to the yogafan dmi_system_id
> > table. Unlike the Legion series, ACPI table extraction reveals this LOQ
> > utilizes an 8-bit EC architecture with a 100x multiplier, but maintains
> > a dual-fan setup via the \_SB.PC00.LPCB.EC0.FA1S and FA2S paths.
> >
> > A new loq_15iax9_8bit_dual_cfg structure was added to properly map thes=
e
> > hardware registers and calculate RPMs correctly while avoiding path
> > conflicts with AMD-based LOQ variants.
> >
> > Signed-off-by: Sarbajit Sarkar <sarbajitsarkar16108@gmail.com>
>
> Applied.
>
> Thanks,
> Guenter
