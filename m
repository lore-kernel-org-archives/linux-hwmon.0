Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690AD4C77D6
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 19:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786043984; cv=none; b=TVijFmPVFexaXgcyvJJHg8AFKhOwlmWtxji4EOOPvdnMS5DXcnmyEM+4i66VQ7kn3j4kzZIPcg22kdnT1DUo6/zReW6x2W0tTsPmH9Iiors900zBl9zKPLpLNd5iNZrGt4sjoc0uaa+pwySrlHIz/NkpYClPWxZT30SNp6HSD6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786043984; c=relaxed/simple;
	bh=P3nUVCSovszBUeASSZSC/8jx1SbR8fKFoFTWXy9/DiU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=P0d/X0JlFDHZLDQe1prkXIYu8GlxSiRLTGA6NqQPNpvILlyvmxS0D9bQSl06A1vLiAct7O78Vqr4O9a3yDOhmcGmX39GOm/Z88UyDkJNR4SoB3X8rXyO1q4c884dobWA84tQv1jUEaYZFzSmg5n9/UuH6rz532+aT/f5mlC9WuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sqGjToZv; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sqGjToZv"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-84a2dcede83so3682049b3a.3
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 12:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786043981; x=1786648781; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jjxhIV/YLeddzFCGnjZyjlWbUTcwZ9aDw5knzXJ/RhI=;
        b=sqGjToZvMTVYEiT0qnm9CD6HWiHLboz46Eciw1+sIQsolBu9/8dP5ZXYJVPW/MpAJO
         vmqn48qlIetNTP0bDWaWH/1UpOuQ+amaxmOmjVd4troKt0S4VJ8VlFvZKOb2QYxw3mmJ
         1NYc5Xv/ReHUWjyoWRY/Ofx6pZnlqLdVU6MGT4rke70ryjXOzp4ijS/x/yWVre6eN9V/
         1EGipSq6/Ba65yqtpvr7KMw7L1ah8CIPwIwHVsoSNJOH7R7dcCrnHszw4Llkej5mbJBk
         Cv6a2wGTCPWVbUT0G48fIbIFUkXFXk1KOg/LsRDl6tlZstiyuNia+01Js0sicRoS25H2
         gJ0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786043981; x=1786648781;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jjxhIV/YLeddzFCGnjZyjlWbUTcwZ9aDw5knzXJ/RhI=;
        b=qpr7ILazvIOZU7JcuSRJTuh3eimPyC4H/S3PORP7BzTtbvsXOTq819+EsiYNrBkjGC
         uPH4ie4ZaV8eW0ilm7GUSyLsXG3q1nLdAcP6TPmOpEoERLwMfVOQv+5rgATw30UZV0R7
         fxcWxiYkvHde1DalE5Qy47xS2KvMNWm4WVIe7BS3fBar3KcMcR1YgcM/gggEqo9PBpHT
         Ujf7GtsPXcMTK9jni8XtFLq9u9AMElTkMBHBwb9V1oP5AVMOKnWcswYAf3aaZ/aFg3n0
         Ltcxv5BLTNHVKlgnawWW1BiNbxoqGo3iEFm4/ghNqz1a//+9JZ5GAS0EogSCcAkiHEu7
         wthw==
X-Gm-Message-State: AOJu0YzlWoRZo8R/CQgT3xoQ3/Rg08+4BI4LvhIyKtFdJys2kFlX5Rel
	HagwZB/Dcli3LlB7ENTOU9IziO+3BiklWxTgL3WYmD4SYuV/qa7EKvpP
X-Gm-Gg: AR+sD13eo8IIy8uvoUmBYFx7D6dxaDs7/mKXQaMvZUwbnIR32EnjH2kkbNJcAJN1wOn
	X1BNs9Xnjg6s897BK6RIaFoFAeTn2ZkfCtczgxUNQ3Zso/BNVz4Q9Ma6UC6TfHJAqqIJ6UYyEhH
	E3FOp82GAZ+Sgejgfc80gwOjugNtfm9MQUE00x0ta91c6Vc3tw4n2ksLivmsl0o9QPaYErhW0Pi
	BnUGRKX1juaKc/7ebvJNfDuHLsS8DYMahvL4JDFJBTulmWcgwRLPs6wOBMX6r1XSq5FEKktIUZF
	Ed6VbLm/nf43tqGNiDwrJyIijP8Y3NY1cMYPP9JJ/n3xP2xcYQ8utjLr77a6o2AJvRPZOsa9mav
	et1pm34uRFd4+R4BjvBph4ndPalErFoX1FAG0uU1U4fhCKSI6ZaB3YF9ZoxvTiiTD2Z3wYY2CSO
	yDC+VdoLMAuSFMjxbtbIGcyx63Mp1PzQdXPpWhYjyHjUOzB2qduUeekdS5IbjBtP4P2E/yrM1Fg
	ZC/irGVo3W+
X-Received: by 2002:a05:6a00:4f95:b0:848:44ae:47c4 with SMTP id d2e1a72fcca58-84f2dfea210mr19346843b3a.20.1786043981475;
        Thu, 06 Aug 2026 12:19:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84f456b7465sm2020374b3a.39.2026.08.06.12.19.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 12:19:41 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 12:19:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/3] hwmon: (core) Constify device attributes
Message-ID: <d68a9077-177d-4219-9a14-390314012c45@roeck-us.net>
References: <20260806-sysfs-const-attr-hwmon-v2-0-22fee8b85509@weissschuh.net>
 <20260806-sysfs-const-attr-hwmon-v2-1-22fee8b85509@weissschuh.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260806-sysfs-const-attr-hwmon-v2-1-22fee8b85509@weissschuh.net>

On Thu, Aug 06, 2026 at 08:09:11AM +0200, Thomas Weiﬂschuh wrote:
> Mark the attribute structures as const, as they are never modified.
> 
> Signed-off-by: Thomas Weiﬂschuh <linux@weissschuh.net>

Applied.

Thanks,
Guenter
