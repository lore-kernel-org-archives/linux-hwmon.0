Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB35B35B63B
	for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 16:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529674; cv=none; b=vAMomJ/up8xEU4ZelqbNcwqogsxVaIk18tLEDeWj/lhKxYO+1S0BWMNguuTzUrEwfECXfHwi2LVnvj/wz5Fe6lyHYJ3clRcR43j/g0E0YSK35UtfxdFiw14wp8c4JFc7XcR6u3OsUvatdEHBkbpFjfpUfckW2FdcaP/DczEnS0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529674; c=relaxed/simple;
	bh=fJLO8mgR7MxzQJPxJHeEwCXhX/hLZZN104VEgWIUYMM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/XQ5seH8V/Xc6wUf3WP6xRpHnzhVDV7YLjSnmx/T0o+4LHXIYPvMQJsS3c5RrInTUF5ILsmbp1pJ2KIYBjxnRC5MMVVtnGOKELQnmigL+Gj31Yflj2SpVHprgIqdkP8yRY3LB2mD3BrbEs8J6CD7Cv6x9pw5eN3O9ZkNvMbWGk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VQrNcw/O; arc=none smtp.client-ip=209.85.217.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VQrNcw/O"
Received: by mail-vs1-f45.google.com with SMTP id ada2fe7eead31-5f54d6b4047so3445894137.0
        for <linux-hwmon@vger.kernel.org>; Tue, 27 Jan 2026 08:01:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769529671; x=1770134471; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=glwth67pMNa1uo+tDZsuuxF/rVPpQOEYq0+JJJ0P8F0=;
        b=VQrNcw/OI9kqnk/UE7PDQNakCk/xrCl8Za0UYRRMaNWbKJmVbkWSs9aChJXRh0qLp7
         knQ+VWjAbF4rUu9/YmsHGixOufkTWAbGAaUjISmemQwME7WbXY6eEDR19S32KsDmMHjR
         khR6pijFeP5KOQAf8ZWKat1Qw5byCKvGQVXNQMDiqS2+5BuFYHF80+G7raqnnyf/2wiZ
         ibyoT71mWhn0jQLCaGFnOA0hxw61uqnyvts0h1s2Qx2NuJ/DYeTMG2YFZCpk68xM5c1N
         Tiw2RFTGa7TgCubYq1Y7KwMCigZ8GHjBOf+bHp0fJxRj35VF1CgdIOzlp2QDbcgUw0xa
         byfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769529671; x=1770134471;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=glwth67pMNa1uo+tDZsuuxF/rVPpQOEYq0+JJJ0P8F0=;
        b=EjOtxr11Vr7jEhdYAIwUhj3e4tZ3xx6Ahf5kfSw0uDU1QRisF7otDdkCPKTw+D7gcV
         OvyXot3zuuZn+fVHQQxbXLEgi+Yfu8TC2+JhJgUbGaF+dhNuNhWOcKB5lZdKpq4eFNy/
         BBYZmtpy2wMuvlOTVGlgT4gnEE2xSg1d7JziNPFWM9B0fZhWeDjlMO8OdnCKT5QbOGYH
         cfW6ZLT2CcljFbfLh4dYGkOIEyZAtwQ+nJHf/q1IZfKh9SrSJv0dklO1ko7dvSum1yJk
         mjtPXavSrJtbUYO7CCgsDdFSnwC9knSoC/6bH6WFJKaORhOGvv6pMAUqOecFEaWxrijU
         U0eA==
X-Forwarded-Encrypted: i=1; AJvYcCWrAuKb1GVH0MUgeKbXDsmuaJ6wdNvTd1Og2HTDbdpTan8V8SetbimWDIyR7tTXU0oIBRKaCjG1rT0T0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf7prVGzCy2VrMBRi7DYqdQ0lWs3UYB/4s+RjoqTbNJvo919Hs
	oIETxwmvU+xZk0pilrI1sxHAWfgT4SCwEh3xCp010PSPkAhgDnuk0LEfuNkwDrSG
X-Gm-Gg: AZuq6aIn5eTeGItL9TDdzzMZMsKrFE4qVbedN9hwUmNuTQniX0jNFfXFjo1YcxGzCET
	FgA/uhw44fbEB4cLwoKPdfWcyWQe+n26ITFN3jZGpmBaxpzdpILNGDKvFhIkTfDQoF4mY6KuXfK
	EqQSAF3nIsXx2SGMnKXM4u2BEJ22+v3G55AqGGXxZKxltpNbM0z5yaAAttlqNkx2FioUjGaCvyJ
	vmNUcQshTem+ofDTc44BZhaDLqPbrEhvHNaoOEO8NwskptX5nnYKWReKkr/biuyv3u+6nQpe8DF
	3vwf3gilXc2NsLxnxcTj2m9V0r+YZn3BkcZ+xo6hI4pngP+mHw78Ik3WgByDGbHKRHLA7WO5yqB
	wxXf7w9sbL227AATA8ThbrVP2qTLkBQt0JnWMuJoce1jSfMNvgJCTIfhR54T7f1mWHqC6uzuiib
	uVG5Wvae0CZHWDZ2+LkXxy4XpjsMzJI3vFTS1g8uR3HdsNet9kRapBBoxE8i1kz9OzqtU2RSQ=
X-Received: by 2002:a17:902:ccc2:b0:295:59ef:809e with SMTP id d9443c01a7336-2a870d9a24amr18044895ad.24.1769523850026;
        Tue, 27 Jan 2026 06:24:10 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a802f9762esm120834775ad.55.2026.01.27.06.24.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 06:24:09 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fff54ec8-496e-4c26-b652-358dc4de0de0@roeck-us.net>
Date: Tue, 27 Jan 2026 06:24:08 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: acpi_power_meter: power*_average sysfs read hangs, mutex deadlock
 in hwmon_attr_show since v6.18.y
To: Jaroslav Pulchart <jaroslav.pulchart@gooddata.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, linux-acpi@vger.kernel.org,
 linux-hwmon@vger.kernel.org, Igor Raits <igor@gooddata.com>,
 Daniel Secik <daniel.secik@gooddata.com>,
 Zdenek Pesek <zdenek.pesek@gooddata.com>,
 Jiri Jurica <jiri.jurica@gooddata.com>, Huisong Li <lihuisong@huawei.com>
References: <CAK8fFZ58fidGUCHi5WFX0uoTPzveUUDzT=k=AAm4yWo3bAuCFg@mail.gmail.com>
 <CAJZ5v0jSbGtRYkjqeuYaT3LXbeZ-xk_Gc0dbCpTZPc6nBD8eCQ@mail.gmail.com>
 <e03c8b69-e667-45b8-b82c-2cd4f1c96bdf@roeck-us.net>
 <CAJZ5v0hvKzKTWA8jFYVDHttd+hDv1juu87vgyhf2udOGbqrQdg@mail.gmail.com>
 <d7f34e0f-e258-4fef-93eb-1ef0a3123d95@roeck-us.net>
 <CAK8fFZ4izdX_HDtGN60CZ3Ta61nqkUg7ncViM=mGgxKki_5FoQ@mail.gmail.com>
 <a7334568-13ce-4600-8650-607273e67976@roeck-us.net>
 <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAK8fFZ6gKs7s2rJ=f7bt24f+_cY-jGU33TvX3UP=U58uK-1KaQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/27/26 03:58, Jaroslav Pulchart wrote:
...
>>> Hello,
>>>
>>> Thank you for the analysis and insights.
>>>
>>> To add some context from our side: we observe this issue shortly after
>>> a server reinstall or fw updates followed by a reboot, typically when
>>> hwmon sensors are accessed for the first time (e.g. by monitoring during
>>> early system initialization). We have not seen it trigger during normal
>>> operation, such as a simple reboot or on long-running systems.
>>>
>>> Given this behavior, it is possible that the issue is related to
>>> hwmon_device_unregister() being triggered early during system
>>> initialization, but I do not have concrete evidence at this point.
>>>
>>> As a workaround, we will exclude the ACPI power meter from hwmon monitoring
>>> (Grafana Alloy) until the mentioned refactoring or a fix becomes available.
>>>
>>
>> Would it be possible for you to test the patch series I just sent out ?
> 
> I suppose these 5 patches from
> https://lore.kernel.org/lkml/20260123182208.2229670-1-linux@roeck-us.net/
>   ?

Correct.

> I will try them and let you know.
> 
Thanks !

Guenter

