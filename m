Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.180
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974733;
	b=jFB7XXxj7bse17dUrx4Cf4iLmhYHbaxu3w+Y94Hhnte1xRsedfXuMSiHm6yVDP9FihHA
	 UZ0gP2fsXSoVOTuqX6wXD7I39R3x09D6p1roiRNPD5AMt/6G01vSftcVcDpgv9SQhC8B/
	 +HDkVXWxNkKz1GhAt9j6TDsgVH6jfdDN+86x+QYDwmrLsSQUs9qhKcmNxP11XUgb/pCqp
	 BohGds0Vpgt74IcqQ4dFDBzcv6sUnDPPuHxH1A3Wv5yLIRtoz7ndn0D6Y/4oLkoQYkNK/
	 R+3jb3uZ7Z+EszEtMdwXnu+in5XP8jGGE5FR1qXeVF/q96uwH9ts+6LfhCkRe1RAaDQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
	b=T4OZOlZojsoSwnGbj4Fy/KOdtvAUb5auAxgHhkxtlCY5Fn7TTgdbJTzbDQ4ARmdm1ZaH
	 PhRCN0qlZobKDZn1TP9jUN//kBwcFLaXVlexwquzXgrnvtiWqhwZllNxnaiRQJSy+xSGC
	 gjEjnJOM8wIiCcRzQxzl78xmbi5dnFiHR3asCNickv1QtKFOoMqeAI8i9v5zqq0CN//+t
	 iu/gX0pVeTsNa1lgOfZcKzqftx1YjUhCYFTTtRCq4OWubICt4ukeJvIDG99yG7UFxmqUv
	 2gAx6I11PP2Y1wR3YYB8fW2gjzJv+FRcpmFq5um6TVZc7FylrzBWAn0N5apitFnLJ9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6pWqzPj;
	arc=none smtp.remote-ip=209.85.214.180
Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD8E606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ACD8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=I6pWqzPj
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2e5fb79ce82so15498835ad.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974732; x=1793579532; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
        b=I6pWqzPjSgZLdxH34xc2dF+rZUuuIatv+YisOPFKEasZOKbUr/+KWvJu5PTfZceiS4
         P8d66oqH8rf5x3VqTv1gRyI+725YMimPt7AnUi3kr0znJFAuIqQEWKbYy/NRkjaHjxCv
         58CnUcXPwIcKrlStfd63Zeaci3ljmfoZmh4LZdhqPidscbUb/KER5RT8TCwDUAEDhe0f
         BbMXF02iL0OMyWo0iiFsC6WFfFJ2GgYUd7Y4Gi2+vlMJh7EHzvFBVvah+U1X3/PzAPLS
         4PIcfgmPbH0bpxVTAgqg3sSihMSlGMqHuVg1Txz/3MZ2q3Dff4/AnaLDtHKvyQBhwmMP
         9UbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974732; x=1793579532;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/cCFGfv4+RhGeu8mMlHwvLdoS33FbKvKHA2FJNQdGOY=;
        b=QTPuhSI/r9HxEPnv0CTn23/nniICe9Dp2l2NjyNRFnD11I4XgasYnYzWVkfMHOtpf8
         KtA4MPaAG2JGp0E4sRRFVYYF0EfCxCSbYBIo30/Ey+u08dmaz4rg2fIYYjbDl2zUaHA4
         gofMuXGlGOC6L0GfiRdeDGGrtbTVSn8BJ/bgpZvjWLFQiFosXPDPJPxEyLeYfbwjSeNv
         OB8QsKi8qRAG/7LiP9cFwUdrUVX+u2KclSdns7l1hjWg4j4npQlrOu8hHebjaTGUxq8J
         BvTOEhggNtlxL9BM/ynwUr4QBf9AEuA8zB8b5sK5WdNTLAMt4gq9klvmAr6NMraQf6p2
         OFLA==
X-Forwarded-Encrypted: i=1; AKwUvBwF1lFxG7ivXWH8UtTXUFuc969ZHiZocJf3F9nK6aV54mGGltuHaaUJRd7uKOm78dk60fzEBXHUbMgJag==@vger.kernel.org
X-Gm-Message-State: AFq9FYItGvGODnrtXf+Vwr5zHTV7v3F8J6zVCi1+5RInGI94VVfFYc5c
	uFYvPh7NRb9TyA5KJtrvZ3fOXYoGLHk7DOSdZ9gnD7NxPq+30SF5Rv8H
X-Gm-Gg: AYBFou3uHUlv4QHQ+Cqxi5kOJoOPCflr2m0axIvMpK2CWceVqQbkA8t+1xBiNNsBiGx
	oGf6o65yzY7TK293WB9qeC4clRmHXVYAw5MbcIAxlkMNvzZiBRIBvJtQNQVJs3nQoSgiKc/47XK
	KckV/U4SHdt2PW/07vfy10GUbC2jyITUarJbbBpZRKkYeW7siTDNVZUiYlLzx6CgnjU3QuOBfzk
	O0gQrvb02glFHsnK2q5jwFzI71Of8/mNyz0A0KuuT7dn/opkfUncmfPiBidqUdBK2FSDTfiD+9t
	u88wklPY7vID3zoU8V007QYjsJQtNUb0+3Iyg7HcE2D7OP1dhrRbFYRu2+7dqHRseR2o7TIilot
	pVgN1rthXLwGGhhu2q2WJMtVPSI/ygaYL6WtrClZ/faa9XlWDiu/osa7fSRWhF5wI5he62sG1Hf
	Xm5umDWUuxjSvckXlLoozpf8arIojoCf/y8DtPg3sUys+kgWwMR7F2Ix4dcEigESMfgAvdQAay9
	BW87j60yhvm9r+sjDZKzmVWRkljeXJlbaMeItDHUr2dUbs4M9velU3XFE2Rfc9er6BP22Q=
X-Received: by 2002:a17:90b:2745:b0:3ab:c674:cad1 with SMTP id 98e67ed59e1d1-3adeafd682bmr4403381a91.50.1792974732064;
        Sun, 25 Oct 2026 17:32:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebaddd45sm4618312a91.2.2026.10.25.17.32.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:32:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:32:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Remy Demangeot <remy@demangeot.net>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Eugene Shalygin <eugene.shalygin@gmail.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add MAXIMUS IX EXTREME
Message-ID: <bd8640cb-cc7c-4e52-afe6-635c0dce0ab6@roeck-us.net>
References: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261015-b4-m9e-extreme-v1-1-621da921e320@demangeot.net>

On Thu, Oct 15, 2026 at 06:09:31PM +0200, Remy Demangeot wrote:
> From: Remy Demangeot <remy@demangeot.net>
> 
> Add support for the ROG MAXIMUS IX EXTREME (Intel Z270). The board
> uses the same EC layout as the PRIME Z270-A for the chipset and
> T_Sensor temperatures, and additionally exposes the VRM temperature
> at the same register as the 300-series boards (bank 0, 0x3e), so add
> that sensor to the Intel 200-series family.
> 
> The hardware access mutex is \_SB_.PCI0.LPCB.SIO1.MUT0, as on the
> PRIME Z270-A (verified in the board's DSDT).
> 
> Readings were checked against HWiNFO 8.54 on the same machine
> (Chipset 47 C, T_Sensor 25 C, VRM 32 C).
> 
> Signed-off-by: Remy Demangeot <remy@demangeot.net>

Applied.

> ---
> The board's EC also exposes more sensors that HWiNFO reads, but they
> need access patterns the driver does not have yet:
>  - three extension card fans (EXT_FAN1-3): write 0x0a/0x0b/0x0c to
>    bank 0 register 0x43 (selector), then read 0x57:0x58 (BE RPM);
>  - EXT_Sensor1-3 temperatures at bank 0, 0x60-0x62;
>  - Water_In/Out and Water_In2/Out2 on a second EC (firmware ID
>    "RGE2-Z270-0109") at I/O ports 0x68/0x6c, bank 1, registers
>    0x0d/0x0b/0x13/0x11 (same offsets as Water_In/Out on AMD boards).
> 
> I have a working out-of-tree driver for these and can prepare follow-up
> patches if this approach would be acceptable.

I am curions - any reason to assume that it would _not_ be acceptable ?

Thanks,
Guenter
