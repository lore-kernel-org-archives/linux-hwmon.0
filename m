Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6857D206040
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Oct 2024 09:51:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729072268; cv=none; b=BZhu2O4nBJ44J0DDdp9MzmqUJo3itec0bwL1bnV9rFz+4lgtKVpVpWPAIG9n54L2+ApIHyNZl1fdcDsuWxLmMJDCOGl8TTqLMU3tGwFGWCPiMPplfB5/eiSEFsoPt/GglKQBCqkcpg10F+U4wU0LMRmURPmSUtG4rPZiNmjW2ck=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729072268; c=relaxed/simple;
	bh=Cj86NyIswgKoqmx4W92A+phSXUB2YaLiIZDYapAeldo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Tm3CU3hHlqshGAXPM3Zxzz+MRxqQCyDgibxpHqiDfLpMFPKjyVcsUhXROBbMqIALjq5sFnhVooF8StDdT9gToiOp39jgLAZSzIh1UzcwVfgRZsJbfd66qcZtb9cK99gD4+FdxK54DXrTa7OwF6rmgNIaKFDRvKFviP/wHzzDMa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=CGEPSZOd; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="CGEPSZOd"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7db1f13b14aso5307811a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Oct 2024 02:51:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1729072267; x=1729677067; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=55z7MQbfeSSb5xwJVgndR9t0TWHNOqYIoBbegmDTohc=;
        b=CGEPSZOdx/fiuZNgETUbHRFOd4P3A04qoFoeK1v7tnCAv05pTpUnEtPmeyNXLurQ5m
         KZvqjfH7YjFFZ1GaJv+QmodZ2BDEkLMBhBuG2tyPdx4GVoC0AfSFHkJ7EVGbtJXhdRrI
         VM5r0216pr3mjaSsRX/SfqMoV6buERrmI7U141c6ueAD1LJeZTClQPYt4TEE8aLQpUjs
         2gUiGkJt8edGcxbz1+F5Cvv5NL4l55Wv+/f8xfaEP4yBsqn8XHY91BdmZCXNY0MT3goW
         zEcglYJKeX4XqcwFJDmY+RClpg0IQpa1n1smLTik4vAflHui/wOx4ERfvuTFfw/45Xfc
         A60Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729072267; x=1729677067;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55z7MQbfeSSb5xwJVgndR9t0TWHNOqYIoBbegmDTohc=;
        b=ZrLfRfOqdPuTS1jQvf79bNgB1F39SPnm9qQEXDg7VjxXDpzQ+YV7kHSmlRa8eHbITM
         QtIaMZhlnCpvesjx1M3zYDXfvp7s2GTNyBBEyiU4oi/ZttRuO/Hu9kJQo1DUPx0cc19c
         UmI9N52Uxxk3b32nHwa9QZvg2uI+06cdOlveYvA0FDBtySq1aO5q7NggUuxd0gQ9C5Ri
         VEP/PeSrvrnztp4W3LCelPqrOonrzPZyF44BpcT0/4fmX98+Vh5ytzHH2mxopaqHY8wh
         ufd4e0sKKOEpFbUvH3B1HO0qg9eTiLsfr5Se7kr6nNSz2B/tVRHQz5of5ak70loHSXYo
         XyWw==
X-Forwarded-Encrypted: i=1; AJvYcCXGbMKvHFihBvK0U1hzVyRuS0Tqht2KzLdoer7fd3CbPYv9aa3LnECNBdFnzyMg29m8iXXCcDvF5BCnNg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbi8wfMvQ9yhkCQBQmkmqsMVIbL6z1rrNLZWkyXi8E7s0RoV/p
	9ypegUfyjyzfCno0eAkQ1aktwDBsgl185VfLKC83gx0Kj9cdJABJdFu9y9XC+ybanOLizul6wtM
	rTTPiS49i739c87Bn0U3UYk6kllEY/VKO2E/P7S2dkzVfZpUZOVoWLxwi
X-Google-Smtp-Source: AGHT+IEFyMfBHqpooctvg2iThMuJ2EZL7X1ymRn7DPngXS/aofDO/dY9X6Azot0jpV1C8esxg0Ncunf+8mxEudBKvL0=
X-Received: by 2002:a05:6a21:38f:b0:1d8:a29b:8f6f with SMTP id
 adf61e73a8af0-1d905ebfe64mr5058933637.16.1729072266720; Wed, 16 Oct 2024
 02:51:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241015113329.667831-1-naresh.solanki@9elements.com>
 <20241015113329.667831-2-naresh.solanki@9elements.com> <c07435f5-af3f-46e2-8e4d-b0a42969b60a@kernel.org>
 <30089bac-e764-45ca-b0fd-f0eb0333e632@roeck-us.net> <b981df66-2501-40ad-8064-158cf93407f7@kernel.org>
In-Reply-To: <b981df66-2501-40ad-8064-158cf93407f7@kernel.org>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Wed, 16 Oct 2024 15:20:56 +0530
Message-ID: <CABqG17hNSOA6onnH6Bp2oOGRiS_8EMnp4fGyWYZEYG5+HQYceQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] dt-bindings: hwmon: pmbus: pli209bc: Add bindings
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Jean Delvare <jdelvare@suse.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Sylvester Bauer <sylv@sylv.io>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Krzysztof, Guenter,

On Tue, 15 Oct 2024 at 20:19, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> On 15/10/2024 16:10, Guenter Roeck wrote:
> > On 10/15/24 04:48, Krzysztof Kozlowski wrote:
> >> On 15/10/2024 13:33, Naresh Solanki wrote:
> >>> Add bindings for Vicor pli1209bc.
> >>> It a Digital Supervisor with Isolation for use with BCM Bus Converter
> >>> Modules.
> >>>
> >>> Signed-off-by: Naresh Solanki <naresh.solanki@9elements.com>
> >>> ---
> >>>   .../bindings/hwmon/pmbus/vicor,pli1209bc.yaml | 65 +++++++++++++++++++
> >>
> >> This has to be squashed with previous patch.
Ack
> >>
> >
> > Neither me nor the hwmon mailing list was copied on that previous patch
> > (or on an intro patch if there was one), so I have no idea what this
> > is about.
>
> Heh... that's even worse because without that visibility you would pick
> up this patch only leading to duplicated compatibles warnings.
>
> Naresh, sending such patchsets is really not correct. Be sure you
> organize them logically and in fully bisectable way, and then you CC
> relevant people.
Yes this definitely causes confusion. I should have organised it better.
Will make sure I handle it properly. Pardon me for the confusion

Thanks
Naresh
>
> Best regards,
> Krzysztof
>
