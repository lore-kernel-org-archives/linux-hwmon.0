Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3715D480955
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 16:32:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280335; cv=none; b=qHkFD5bIYpI3K1msUZbpSMB9Nl9tUAoOtrNx9EDxGtvENvlZSJYWcS/G3IwSZFNDdFd+SRG8W9SvoPX+qxGXZo8tBlqG/7oXNHWrtxzB+qpNbAPdFDSc8776Ulm6KKltJfr1FhJCeQsSk75JDh/q2dVj3lo/ZGc3Tyno2EZKRsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280335; c=relaxed/simple;
	bh=cuGW7+rutHe2d3d8uNnWYhJktdhFpmVUqpcqcjt2jcc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kvx9gMDQs4m+uuifMWSzc4Bd3+sSGK8vP46Wll3MazgcbI9q2gB4dp8g7DyiTO0lo8PwJ13GkzNtIhWcw+lqAMKdUbDNkn1y8IXLFAXDNyt59GlHeVPDr3ef0wioQinqKdWGJlGda79EJyOGVPhGDYLS42TvowP90Fi8ju7SqB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RLqpyZEs; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RLqpyZEs"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d71ae3455aso17471885ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 09:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788280332; x=1788885132; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S/51frIVJePNqbmCeLkFjZwUhp2laVBU0fYCMt69u/M=;
        b=RLqpyZEsClhtWsMnA8wIpm9x3qzCM/MR7chTxHKHdDvhMIUGrrLJAsEzPtXTzdcLcT
         Fr1g+lR1/GNE2pm5m93zT558gr97KCbxUGjf824IKJY/vSZn4GgaByXlbZK75hXLDY4j
         rPrM+hIIu8JqXAVQvQU+Dkh7D9dx2WHjNDANjxr1EITKFJA+Vg0jx2Gl2OE4MwO4k0of
         v3scndEjDyvlnzJNk16Fl6JuZwkE9xma11UHyfMUdCcg9AoaY1Q9gIIduGrqd4QEhGZR
         IMZyalKCA48rRp+D93Nm2xtTAV/UKiDfElD4mRSgqM4anZ2923oPgmHMA9lAStP+tiQr
         8cGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788280332; x=1788885132;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S/51frIVJePNqbmCeLkFjZwUhp2laVBU0fYCMt69u/M=;
        b=MeaGc1sP/CPlVa+lgksp0b8W4xFCNSkQJEhexPPU5by2i9EeihVtfTZ+jedemBbQ8Z
         LEsFb0vFR6E1to5TF4WU69f/iONbBDn+nBYxvIo8gOjdxQAYyIDMKIR3FhQ7W6WSYPkg
         DwwJBIuMYllToie+nJAAjRthyC5wUTE2PWI1B8gJ2/iTyZ4OI8gB2duRHqn8RuScM5CV
         k/JVvQb9Ov1wKAptc0Ea9h1etmXIE+9kMcG2VF33UjDwFJzV087onCINgLauHAlIeiaU
         yiTLA4I7og9B9+218iG9LFesi6PrP/HRN3YET7jkHLzhsUafDnV57JkxMMELXTLqR60B
         lLRQ==
X-Gm-Message-State: AFuF++k1FYRqy5CPaFMzySH6p304xt7s2DQBevssZb9Lc90MbG6qB4kX
	ew0yo14zujHTfO1/OxjEvc7eZk1fRBQ1WdVzLrKuN2jINuj9nJr7Rrwk
X-Gm-Gg: AYBFou10LlCTrCpbCOBd+yPunCF6fMvNoWwoPlvJA7Z4EWmbTBGWCKj39S1BL/6bAFd
	iR2ggUljQNnjGmEYGMJJNZ6Kog66Zc8NahixiwGsdOBgfeoQDP6O6MaLJvTIkyQ4W8Zmz1PhtN4
	Ko6K5ow0AAWrEWZ8CdPdk5vJ0fCkf7b4KMVup1FVvtsAK1yN7C0QQomMTk6Niwzq/D+FdQHcCyW
	vfu/EQHvfDi3DMbeNQ1fj4X84EGlDpO51r8fnxqHmrZboGpHVO3FPR0KTaQW8cIPEnW2O2cjo/h
	OOSWPnP7niRkf98rp4O19uPz+TSfBjSeY1OxYor5LM7YaC3nNVKbChMBlSFjmgwUCW3AYg4npjs
	3EuYgZeS7mYdF20ccYPIRGDKTDMA6S7dLIZ+3alkHG8b5+EFqmqz0/Nc40q+IBrM/Fv560LTBbg
	/DQGEs+J53UqoRQWu0aH5p1btI7FPh6b9Hz35+92K9YHqqUMKfgGOZuHBzj+K4T4DP5DcTqS/FO
	f1MmvcGPHe4EZZvDNJ0eGH5scTNs6q5UWL0m70UmP9Y8INjl3LUTCxVKkr9
X-Received: by 2002:a17:902:f791:b0:2d9:1dee:43db with SMTP id d9443c01a7336-2d91dee456dmr246787445ad.15.1788280332006;
        Tue, 01 Sep 2026 09:32:12 -0700 (PDT)
Received: from [10.21.0.95] (wnpgmb0592w-ds02-161-177-131.dynamic.bellmts.net. [207.161.177.131])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd4c44bcsm1416555ad.72.2026.09.01.09.32.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 09:32:07 -0700 (PDT)
Message-ID: <9753ed80-5666-42a6-b04c-99b9ef9326fe@gmail.com>
Date: Tue, 1 Sep 2026 11:31:51 -0500
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Betterbird (Linux)
Subject: Re: [BUG] SPD5118 Intermittent MR11 Corruption During Suspend/Resume
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <1a8ea9da-1ac1-4312-a8ca-ea4a9f35093f@gmail.com>
 <ee284272-0da0-45b6-a3be-c76822e5d54f@roeck-us.net>
 <014b9438-e9b7-4be1-b816-002e83a068a0@roeck-us.net>
 <37132c40-aa82-4df1-b5ce-337601f3c085@gmail.com>
 <3c4e9f59-5272-48cf-a4a0-eeefcba955a9@roeck-us.net>
 <763a8b30-8548-4ff0-a1e9-8e74bbfe9b02@gmail.com>
 <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
Content-Language: en-US
From: Matthew Bettencourt <matthew.bettencourt@gmail.com>
In-Reply-To: <6e8761aa-67ef-4624-834d-4b9d0ce729d6@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hello Guenter,

I added additional logging into the piix4_transaction(). I will put the 
function call on the bottom. But as you guessed we are seeing not just 
MR11 corruption but also can trigger on other addresses as well. I was 
running the suspend/resume cycle and caught on both MR11 issue and else 
where. Here is the dmesg log output.

--- Other PIIX4 transation ---
[29287.876603] [ T204612] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[29287.876666] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.876702] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.877232] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.877271] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.877286] [ T204580] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[29287.877346] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29287.877381] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29287.878266] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29287.878302] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29287.878367] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.878399] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.879266] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.879302] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.879369] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29287.879401] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29287.880269] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29287.880308] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29287.880371] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=00
[29287.880402] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=00
[29287.881755] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
[29287.881786] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
[29287.881787] [ T204580] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] 
Pre: (CMD=0x1a, ADD=0xa3) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
[29287.881855] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a7, DAT0=ff, DAT1=00
[29287.881891] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a7, DAT0=ff, DAT1=00
[29287.882423] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29287.882459] [ T204612] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29287.882522] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.882554] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.883081] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29287.883117] [ T204580] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00


--- MR11 corruption ---
[29312.940402] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.940447] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.940980] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.941020] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.941038] [ T204570] spd5118 12-0053: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[29312.941105] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.941142] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.941672] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.941711] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.941727] [ T204600] spd5118 12-0051: PRE BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[29312.941787] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.941820] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.942339] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.942375] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.942450] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.942482] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.943011] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.943047] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.943110] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29312.943142] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29312.943669] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29312.943705] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=1a, ADD=a7, DAT0=00, DAT1=00
[29312.943770] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=00
[29312.943801] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=00
[29312.944337] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=00
[29312.944373] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=1a, ADD=a3, DAT0=00, DAT1=00
[29312.944437] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.944469] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.945842] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=00, CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
[29312.945873] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=01, ADD=45, DAT0=ff, DAT1=00
[29312.945873] [ T204570] i2c i2c-12: [PIIX4 REGISTER MUTATION DETECTED] 
Pre: (CMD=0x0b, ADD=0xa7) -> Post: (CMD=0x01, ADD=0x45) | DAT0=0xff
[29312.945940] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=ff, DAT1=00
[29312.945974] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=ff, DAT1=00
[29312.946849] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.946885] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.946954] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a6, DAT0=f8, DAT1=00
[29312.946986] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a6, DAT0=f8, DAT1=00
[29312.947337] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a6, DAT0=f8, DAT1=00
[29312.947377] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a6, DAT0=f8, DAT1=00
[29312.947440] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=00
[29312.947472] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=00
[29312.948001] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=00
[29312.948038] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=1a, ADD=a2, DAT0=01, DAT1=00
[29312.948101] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=00
[29312.948133] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=00
[29312.948661] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=00
[29312.948697] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=1a, ADD=a6, DAT0=01, DAT1=00
[29312.948757] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=00
[29312.948789] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a3, DAT0=01, DAT1=00
[29312.949328] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.949364] [ T204600] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a3, DAT0=00, DAT1=00
[29312.949376] [ T204600] spd5118 12-0051: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x00
[29312.949429] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 1: PRE-START] 
CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.949460] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 2: POST-START 
BIT] CNT=08, CMD=0b, ADD=a7, DAT0=00, DAT1=00
[29312.949993] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 3: POST-WAIT] 
STS=02, CNT=08, CMD=0b, ADD=a7, DAT0=08, DAT1=00
[29312.950029] [ T204570] i2c i2c-12: [PIIX4 TRACE STEP 4: POST-CLEANUP] 
CNT=08, CMD=0b, ADD=a7, DAT0=08, DAT1=00
[29312.950040] [ T204570] spd5118 12-0053: POST BIT UPDATE: SUSPEND MR11 
(0x0B) -> Cache: 0x00 | Bus: 0x08


--- piix4 transaction function ---
int piix4_transaction(struct i2c_adapter *piix4_adapter, unsigned short 
piix4_smba)
{
     int temp;
     int result = 0;
     int timeout = 0;

     /* Register snapshot variables for pre vs. post checking */
     u8 pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1;
     u8 post_cnt, post_cmd, post_add, post_dat0, post_dat1;

     /* Read initial register state before starting */
     pre_cnt  = inb_p(SMBHSTCNT);
     pre_cmd  = inb_p(SMBHSTCMD);
     pre_add  = inb_p(SMBHSTADD);
     pre_dat0 = inb_p(SMBHSTDAT0);
     pre_dat1 = inb_p(SMBHSTDAT1);

     dev_info(&piix4_adapter->dev,
              "[PIIX4 TRACE STEP 1: PRE-START] CNT=%02x, CMD=%02x, 
ADD=%02x, DAT0=%02x, DAT1=%02x\n",
              pre_cnt, pre_cmd, pre_add, pre_dat0, pre_dat1);

     /* Make sure the SMBus host is ready to start transmitting */
     if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
         dev_dbg(&piix4_adapter->dev, "SMBus busy (%02x). 
Resetting...\n", temp);
         outb_p(temp, SMBHSTSTS);
         if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
             dev_err(&piix4_adapter->dev, "Failed! (%02x)\n", temp);
             return -EBUSY;
         } else {
             dev_dbg(&piix4_adapter->dev, "Successful!\n");
         }
     }

     /* start the transaction by setting bit 6 */
     outb_p(inb(SMBHSTCNT) | 0x040, SMBHSTCNT);

     dev_info(&piix4_adapter->dev,
              "[PIIX4 TRACE STEP 2: POST-START BIT] CNT=%02x, CMD=%02x, 
ADD=%02x, DAT0=%02x, DAT1=%02x\n",
              inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
              inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));

     /* We will always wait for a fraction of a second! (See PIIX4 docs 
errata) */
     if (srvrworks_csb5_delay) /* Extra delay for SERVERWORKS_CSB5 */
         usleep_range(2000, 2100);
     else
         usleep_range(250, 500);

     while ((++timeout < MAX_TIMEOUT) &&
         ((temp = inb_p(SMBHSTSTS)) & 0x01))
         usleep_range(250, 500);

     dev_info(&piix4_adapter->dev,
              "[PIIX4 TRACE STEP 3: POST-WAIT] STS=%02x, CNT=%02x, 
CMD=%02x, ADD=%02x, DAT0=%02x, DAT1=%02x\n",
              temp, inb_p(SMBHSTCNT), inb_p(SMBHSTCMD), inb_p(SMBHSTADD),
              inb_p(SMBHSTDAT0), inb_p(SMBHSTDAT1));

     /* If the SMBus is still busy, we give up */
     if (timeout == MAX_TIMEOUT) {
         dev_err(&piix4_adapter->dev, "SMBus Timeout!\n");
         result = -ETIMEDOUT;
     }

     if (temp & 0x10) {
         result = -EIO;
         dev_err(&piix4_adapter->dev, "Error: Failed bus transaction\n");
     }

     if (temp & 0x08) {
         result = -EIO;
         dev_dbg(&piix4_adapter->dev, "Bus collision! SMBus may be 
locked until next hard reset. (sorry!)\n");
     }

     if (temp & 0x04) {
         result = -ENXIO;
         dev_dbg(&piix4_adapter->dev, "Error: no response!\n");
     }

     if (inb_p(SMBHSTSTS) != 0x00)
         outb_p(inb(SMBHSTSTS), SMBHSTSTS);

     if ((temp = inb_p(SMBHSTSTS)) != 0x00) {
         dev_err(&piix4_adapter->dev, "Failed reset at end of 
transaction (%02x)\n", temp);
     }

     /* Read final register state */
     post_cnt  = inb_p(SMBHSTCNT);
     post_cmd  = inb_p(SMBHSTCMD);
     post_add  = inb_p(SMBHSTADD);
     post_dat0 = inb_p(SMBHSTDAT0);
     post_dat1 = inb_p(SMBHSTDAT1);

     dev_info(&piix4_adapter->dev,
              "[PIIX4 TRACE STEP 4: POST-CLEANUP] CNT=%02x, CMD=%02x, 
ADD=%02x, DAT0=%02x, DAT1=%02x\n",
              post_cnt, post_cmd, post_add, post_dat0, post_dat1);

     /* Check for out-of-band mutation of CMD or ADD registers */
     if (pre_cmd != post_cmd || pre_add != post_add) {
         dev_err(&piix4_adapter->dev,
                 "[PIIX4 REGISTER MUTATION DETECTED] Pre: (CMD=0x%02x, 
ADD=0x%02x) -> Post: (CMD=0x%02x, ADD=0x%02x) | DAT0=0x%02x\n",
                 pre_cmd, pre_add, post_cmd, post_add, post_dat0);
     }

     return result;
}


Thanks,
Matthew

On 8/31/26 10:10 PM, Guenter Roeck wrote:
> On 8/31/26 17:16, Matthew Bettencourt wrote:
>> Hello Guenter,
>>
>> Here is the list of i2c devices on my machine
>>
>> grep . /sys/class/i2c-dev/*/name
>> /sys/class/i2c-dev/i2c-0/name:Synopsys DesignWare I2C adapter
>> /sys/class/i2c-dev/i2c-10/name:AMDGPU DM aux hw bus 1
>> /sys/class/i2c-dev/i2c-11/name:AMDGPU DM aux hw bus 2
>> /sys/class/i2c-dev/i2c-12/name:SMBus PIIX4 adapter port 0 at 0b00
>> /sys/class/i2c-dev/i2c-13/name:SMBus PIIX4 adapter port 2 at 0b00
>> /sys/class/i2c-dev/i2c-14/name:SMBus PIIX4 adapter port 1 at 0b20
>> /sys/class/i2c-dev/i2c-1/name:Synopsys DesignWare I2C adapter
>> /sys/class/i2c-dev/i2c-2/name:AMDGPU SMU 0
>> /sys/class/i2c-dev/i2c-3/name:AMDGPU SMU 1
>> /sys/class/i2c-dev/i2c-4/name:AMDGPU DM i2c hw bus 0
>> /sys/class/i2c-dev/i2c-5/name:AMDGPU DM i2c hw bus 1
>> /sys/class/i2c-dev/i2c-6/name:AMDGPU DM i2c hw bus 2
>> /sys/class/i2c-dev/i2c-7/name:AMDGPU DM i2c hw bus 3
>> /sys/class/i2c-dev/i2c-8/name:AMDGPU DM i2c OEM bus
>> /sys/class/i2c-dev/i2c-9/name:AMDGPU DM aux hw bus 0
>>
>> The dmesg output I provided was captured with i2c debugging enabled. 
>> When the issue occurred those are the only i2c transitions I saw.
>>
>> I will try and add some additional logging and checks the controller 
>> driver and see if there are any other i2c transactions with the same 
>> symptoms.
>>
>>  >  The only ideas I have is that somehow an access to another I2C bus
>>  > messes up controller registers, or that there is a real hardware 
>> problem.
>>
>> I am not against the determination that there might hardware issue, 
>> however I got down this rabbit hole after I read a forum post on 
>> level1techs where someone else had the exact issue with the same 
>> memory kit. I have posted in that forum as well but have not gotten a 
>> reply. The original post sounds very similar to this issue but the 
>> user never reports on the actual SPD5118 registers so it is hard to 
>> know for sure.
>>
>> https://forum.level1techs.com/t/msi-x870e-carbon-9950x-2x48gb-ram- 
>> bizzare-issues/222454/23
>>
> 
> I think your log shows exactly what happens (at least in your case):
> The I2C controller sometimes returns 0xff when reading MR11, and from
> there everything goes downhill. As mentioned below, I would suggest to
> add code into piix4_transaction(), check if SMBHSTCMD or SMBHSTADD changes
> between pre and post, and print an error log message when this happens.
> Per your log message, when it happens, the controller returns an MR11
> value of 0xff which is obviously bad and will trigger all kinds
> of issues.
> 
> Obviously that isn't going to explain _why_ this happens, but it is a
> starting point. As for why this is (only) seen if the spd5118 driver
> is loaded: There is no other code writing back MR11. If there is some
> firmware issue, the problem may still exist but not have any adverse
> impact.
> 
> With the debug code mentioned above, we would at least have a chance
> to figure out if there are any other failing read operations or if this
> really only affects MR11.
> 
> Thanks,
> Guenter
