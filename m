Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1ECC12B93
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Dec 2024 10:40:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733049624; cv=none; b=ZbXcxb+oWgGi+SOOCwfKQZA3fgSqO7Gh7oOTcD34tmYtDacfjRch0DOoxoSc9kiGYCV2RJMwcPwx71/OAtI/+BRV8MnLHquU2NX/blsSL/fQe0qrsBt99EoX3W0eJ4aehRdd0qLcH8bE2inESyRxsDuhrgaVO+I5PPMWRePLsFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733049624; c=relaxed/simple;
	bh=dANK812WjGLei/1DrWQZV9XlcFiheic/GwjU6kNjQHI=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=XbJAV3QDETiPqhlS1gyxIqUCNzmLTZZj1LRu1qCekwcFm2niRzjJTh7A8hO45yiB9e4vYlIlUK0G8pnpjN1ftKseRVmmHotuGTPH4ugiRSYMuEwAWpxLoFpA5UrLfgFMFdQWSXqWoT2+InxbhWMyU4Hci4F+bMQYY0rdWK9Vn70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mM4j3Fah; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mM4j3Fah"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0cfb9fecaso1452859a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Dec 2024 02:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733049621; x=1733654421; darn=vger.kernel.org;
        h=content-transfer-encoding:disposition-notification-to:subject:from
         :to:content-language:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sO3xnAf2iiLO8/LOQEBu6LpDDn10vRNXIKV1HmMGAzY=;
        b=mM4j3Fahu5BtCWVldI0jQeyWs4OeFgm98pqsnHndJlijrPv0jo5xeCT9Z4b6KHg9fo
         xUkLF0NUr+t+FhPIesyTRu6vmSTAtoP3Fg4pU2XQO1MgHkiQ6RKyuaiOFBgeeETuZ6im
         KAFb252ApAUMB80Bje4fFbt/uHG78Ccx7AAubkF3l41tH42b5dwGneN4UtpC3GZ9GbtD
         kK7hOw3LIVHXc7mXOcHCoV/ieMFNt3kD51qJGpWswG5vlPC4qarN11ekuoAR4zeXrAbP
         5W8ULS25SNuwra4gMVbGUQHrFBX6sOIHA9c2DvbU2rewbbbwEbTd1dPNlbWjnkKDvnjv
         IXKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733049621; x=1733654421;
        h=content-transfer-encoding:disposition-notification-to:subject:from
         :to:content-language:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sO3xnAf2iiLO8/LOQEBu6LpDDn10vRNXIKV1HmMGAzY=;
        b=SMporIuf85mkUb9VOO5EfgIC42oBKe11sCxwaZmznWdoJqqoKl3+54bOGf103X4Glx
         VxwCJD0kKE/mB8Uh2glOXJkXrR1ibRBdCI3J6vxb50P/au7THjj+AIuVuIqlFDYYc25o
         zXyLU2Y39zd7vpzVkXAaJHlhvpC2rX0UNbfSvMtOQhPgsE4RsDJoC10eyaefsBTC86UF
         Y1vUKalcbJ/aV/NfGjAfo2nHbqMJvdBz9rZ9glK9b2ip9k12n5Vz+HAUHixuUimxiNvh
         aXA6iSEY8cIqi7MRPtTkq/jCIzrdSBMcirPs8vYxgv9vtbNr1JTG+oc8a0dH8GlrBcmh
         ag5A==
X-Forwarded-Encrypted: i=1; AJvYcCXeMiNYyqvCyQjUBiMLGY6RkukW7Rb619jfXJIsu6VgcdcK6EBFv4VpBberop64x/PSe2QNxAoviOX9Vw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSIMtIIj01vjzRiv3OASlGFPmS9vvv41xtnjRuQBnp5BrmCQlN
	J0jtW1u/zwnlAUG/twaDvM5iJhQLGFTL/HEF4U5bHeyls0Z3PapE
X-Gm-Gg: ASbGncs/YJgk01fxEoa96lFpyyGjEinfmNpfS7IXFQ35bc9ODTxf83ewyt/Oj7pauVx
	jhbpktWflTCkx0bZ/JmkEJJ9ABcawA2PIXMP0VdFzxBtHlNLVhtPGZ2mLE7au8W2ZafdHUr9oB4
	wNkkekCGaiJRbtnhyU+oEYjxMcaSbCwZtryyEvefVENjbrlQ3u6DgjceZmnjBGsnxhqQPV0w5Fg
	ztWAdJ5FYyJm3NKpD5kQLv1ZfscipNJGr1h6TubD6pH19VCvsbdtw==
X-Google-Smtp-Source: AGHT+IHBuvL//+Kn+Cgp0fgbpy8m+sRWM5JwAWXS/DDCZDDKZhhxq5jA05oegBpaDoPufebIg7tFsQ==
X-Received: by 2002:a17:906:c4c6:b0:aa5:49f0:1511 with SMTP id a640c23a62f3a-aa58102b2d2mr1220354366b.42.1733049620948;
        Sun, 01 Dec 2024 02:40:20 -0800 (PST)
Received: from [10.2.0.2] ([146.70.83.68])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa5996c1a05sm379530066b.14.2024.12.01.02.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 01 Dec 2024 02:40:20 -0800 (PST)
Message-ID: <0bc76531-d88f-4288-8a3c-023dbe04dfb2@gmail.com>
Date: Sun, 1 Dec 2024 10:40:19 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: W_Armin@gmx.de, hdegoede@redhat.com, linux-hwmon@vger.kernel.org
From: Edoardo Brogiolo <brogioloedoardo@gmail.com>
Subject: [Bug report] Regression in kernel 6.12.1 preventing asus_nb_wmi from
 loading
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear all,

I hope this e-mail finds you well.
I am writing to bring up an issue I have experienced since upgrading to 
the Linux kernel 6.12.1:

I have been unable to set max battery charging, keyboard brightness, and 
actioning special keys (micmute, enable touchpad, etc.).


With the help of the Archlinux devs 
(https://bbs.archlinux.org/viewtopic.php?id=301341), the issue was found 
to have been introduced by

kernel patch b012170fed282151f7ba8988a347670c299f5ab3 
(https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=b012170fed282151f7ba8988a347670c299f5ab3), 
leading to the kernel being unable to load  asus_nb_wmi.


Reverting that patch fixes all of the aforementioned issues. Please see 
the Archlinux bbs thread for full logs and steps taken to identify said 
patch as the cause of the regression.
While I do not possess the technical skills to help developing and 
implementing a fix, I would be keen to help out testing possible 
solutions on my hardware.

Thank you, and kind regards,


Edoardo Brogiolo
