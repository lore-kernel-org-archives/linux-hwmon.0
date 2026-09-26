Received: from relay12.grserver.gr (relay12.grserver.gr [88.99.38.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5C23815F3
	for <linux-hwmon@vger.kernel.org>; Sat, 26 Sep 2026 21:53:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=88.99.38.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790459586; cv=none; b=L15ZtPAhk798Ut5qlmlHnolyXUAetLHm1eij8Q+E8+wU7t4VT48veFy/s/mfiE8X1FSFovR36+9T9Vwivw1zhLYmnwlFUSDAcoWq5DFCkrbg0tDror8pUa8DY06NATCJjjRXuy5Hlit75Ukh9sbE/1zSxFZb0M/qlTfqDHpnrmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790459586; c=relaxed/simple;
	bh=YTeFp0jgejLVrCr+rBop1YjtHx69pHPQUyGMwzRTHmE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DXw3LxWWDiCfTYPIL0bYOLaEaroEE0L+r+nr4clFzkPDquCNeG1ST0WEvsewLfXrM5G3crWSOyq3ss5EYLcoBzrs+dQwlYogebqOhHwBK8VsnHf6ZlVux4dRuhboSCoysApRsW/sW8ra/ARd2jCt47q04+AxsQoFswYnlaX7VyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=L0TvFXZT; arc=none smtp.client-ip=88.99.38.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="L0TvFXZT"
Received: from relay12 (localhost [127.0.0.1])
	by relay12.grserver.gr (Proxmox) with ESMTP id 22E07BD5B2
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 00:53:03 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay12.grserver.gr (Proxmox) with ESMTPS id A237DBD4BA
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 00:53:02 +0300 (EEST)
Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id D92581FF34D
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 00:53:01 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1790459582;
	bh=YTeFp0jgejLVrCr+rBop1YjtHx69pHPQUyGMwzRTHmE=;
	h=Received:From:Subject:To;
	b=L0TvFXZTDStmAjHJiysP9d4rlvo6HLv3cH6+SCSk723hWJJFroBZLpEeLaJPwswX0
	 z1YORvF2sW4XzYF+yI/ws8iKAm+BCUhRMj2dhiVQthFwrkXblh11UVxpwNDu06G0vw
	 9MsR3gXkQZydcWFt0OQGW7eIdG/Hs+IqD56DduJ3N53vwcKoQSSe+0ApstWpOKl7xJ
	 lrLm81ynqeNYAffPAKDWF6GC1mG58V5fHjyC37MhDm2lyzMuphDTvAuHqLlcfRN7i2
	 fCrVWY18Qz2CLIvQ8pPMOkXWMVvCnJ/qj7xqhIk4nrbGoEVS5nmQ4148YiCyyVdUv7
	 r2HTs7QT791VA==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 74.125.228.43) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-pz2-f43.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-pz2-f43.google.com with SMTP id
 d2e1a72fcca58-85469b355ffso838635b3a.1
        for <linux-hwmon@vger.kernel.org>;
 Sat, 26 Sep 2026 14:53:01 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AKwUvBw08fCyANgJU5ShNaiwYv0KvU9E9sIYCfxVXXrLMbXDLSvj8wR8vLiq2X2EdfjH6krIdRy+autyhH+7pw==@vger.kernel.org
X-Gm-Message-State: AFuF++mhzoUvpl5tdwGwbBkKNufJHy64YJbamsMOim1WZZ/8lzmkVMba
	7q4effPllFYJ1QjI1VfeXOYnb0wmi1I0Hh1PP7GRX0u456Zdkesm7r4tTxEkC1dt03PqOLvHmQr
	a0CW+lXYmN9cQgdZ65d7Va+vRN3gIbVg=
X-Received: by 2002:a05:6a00:4650:b0:878:34d7:699f with SMTP id
 d2e1a72fcca58-87e9b79c67fmr7387971b3a.47.1790459580452; Sat, 26 Sep 2026
 14:53:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260926-gpd-fan-duo-auto-v2-0-0a2ea41ee3b5@pm.me>
 <20260926-gpd-fan-duo-auto-v2-2-0a2ea41ee3b5@pm.me>
 <CAGwozwG51ZAWEbhmwAfbU1RNu2QCJ-cnQhXcuKQb8e7bWKVeDQ@mail.gmail.com>
 <1BPT38hSheXA0fiDcjiUhe40l_nA8P9jiPQG4TfQCki6CMVZJr0V2DjfbEvQl1gD1UdajSdRKAlJwAVUWgODbxDTML6hk5lLxkaQeKN0e48=@pm.me>
In-Reply-To: 
 <1BPT38hSheXA0fiDcjiUhe40l_nA8P9jiPQG4TfQCki6CMVZJr0V2DjfbEvQl1gD1UdajSdRKAlJwAVUWgODbxDTML6hk5lLxkaQeKN0e48=@pm.me>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Sat, 26 Sep 2026 23:52:49 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwG+JrZCJ-zkAB7yGCOgQPKDgQOu+oeXiSM9aVB-EbfYsA@mail.gmail.com>
X-Gm-Features: AclHuK8tcP6Ds9UmnsZwAsfoqjeG3H1jn48p6kEdNAPV_V0A8eC1PMP2fUYc3to
Message-ID: 
 <CAGwozwG+JrZCJ-zkAB7yGCOgQPKDgQOu+oeXiSM9aVB-EbfYsA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: (gpd-fan) Register both fans on the GPD Win
 5
To: Alexei Solcanu <alexei.solcanu@pm.me>
Cc: Guenter Roeck <linux@roeck-us.net>,
 Cryolitia PukNgae <cryolitia@uniontech.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <179045958214.826549.3978881890117369594@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.6 at linux3247.grserver.gr
X-Virus-Status: Clean

On Sat, 26 Sept 2026 at 23:36, Alexei Solcanu <alexei.solcanu@pm.me> wrote:
>
> On Sat, 26 Sept 2026 at 22:32, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> > in my view adding all these functions is unneeded complexity. There
> > should be some simpler ternary way.
>
> Ok, I'll inline them as ternaries in v3.
>
> > Are you sure the correct number of fans are populated for each device
> > because of the visible entry? If yes, it is fine for this hunk. If no,
> > needs dynamic population for the struct in probe.
>
> Yes. The hwmon core only creates the attributes for which is_visible()
> returns non-zero. On the Win 5 both channels show up and work
> independently. Loading the driver on it with gpd_fan_board=win_mini
> works as expected: only fan1_input, pwm1 and pwm1_enable are created.
>
> > You also add a board match for win5, but doesnt the duo have two fans?
> [...]
> > Verify which duo-like devices implement two fans, it should be all of
> > them. I think Cryolitia has a Duo. Win Max 3 according to my GPD
> > contact has a duo layout. Unfortunately, I have no users so no DMI. So
> > it is at least Duo, Win Max 3, and Win5. Then make it so only these 3
> > devices (which should need no separation) report two fans and two fan
> > speeds throughout the driver.
>
> Agreed. In v3 I'll drop the separate win5 board and give the duo board
> data two channels instead, so the Duo and the Win 5 share it.
>
> I don't have a Win Max 3, so I can't add its DMI string, but I'll add
> the duo board data to gpd_module_drvdata, so gpd_fan_board=duo can be
> used on it until it has a DMI entry.
>
> I only have a Win 5, so I can't verify the Duo. On the Win 5 the
> second fan's RPM is at 0x0476/0x0477. Cryolitia, could you confirm
> that the Duo uses the same register?

Actually, recalling what we said last year duo had the new layout but
only one fan if I recall. Cryolitia can confirm. Then, only Max 3
needs confirming but even then you still need the new quirk so most of
this patch is good as is

Best,
Antheas

>

