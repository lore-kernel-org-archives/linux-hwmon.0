Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B89128AB0C
	for <linux-hwmon@vger.kernel.org>; Thu, 15 May 2025 08:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747299205; cv=none; b=Dx7E5qn+pJR/UX63B9QW2X4IhazpgZZ0DqQTq8R3WBZwbc7/CRR8IqUmR5C3LxxEXFnZGekGnbkcKWJG+wlhcTQDQHvKgIwcOQvF7Btb9BbahU9VZb8iUAf6dsE0g0ffPS4GgmEk/UngZQjeePs9k03fCPuiiyS22N6ixvO/aY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747299205; c=relaxed/simple;
	bh=lIfNCPP66O5sWacTogM/feH6CoiW9xHNdDEGcTAOa1g=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Gm73ZkisVKY5pZUt52JzD/TEiG6rHmW/Ny9xBex1/IXg2H2i7HguLhvSO/lMaUy5F6SC9JyDjq5a/I8smX7Cl2dYNLBhE+zKICil7Id5yH/mP55Xkyf57Q3gh/Gh9FDXddAv7HgTHpxk6vtej3ewedk2Vd3zzqccs31/Gdke4ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=pass smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=JIbYk9p2; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="JIbYk9p2"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e16234307so7393755ad.0
        for <linux-hwmon@vger.kernel.org>; Thu, 15 May 2025 01:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1747299201; x=1747904001; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=JIbYk9p23k25N0ts46ZfByaxfR0wUe8eftbnQ8WcAraUkc5xwLHLFqGjjEukAywz6N
         xSR1QlxoxfR27yuHr2SMsufGmo4iLnqENPkJKf0yWc6eUI7Ip51A+C8pXOwOTTsMWTcA
         2m21uEEzRYwdxC0NsLOM2H6iSYtdMdDzNxlQI2FLcuBTS9IyA/b2O+4ZzbywUS0ZM+Go
         M1ln70M26ZUX26+5VM+EUUV4+kf13mIc9ImYLFzoIxZSZuYL8fXnC0Fnomg92SCdwsy3
         wIfQATH+vKhLNKmwIZ4b5TPob6Rp6xCh/kSfn2VeVPMTyC70Eyl7YnXo+D0KjFRIaBor
         /I0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747299201; x=1747904001;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nOVoQnwWT25lQttWoZH7JoBjuOJGRtQg1frpngi8VzY=;
        b=pPsKVxxMtAgmOffNoIGTNgXOXsVpHxN2nTGjD+3b7lUvTVlhPBC3PuNJowEcGq2dld
         fApA0tzwZam11/owAZW4qGrQLmdzTRcZdgqQblKKasMBjDQWMWoDNLONTvZwzgi6MzxR
         0qveN6i0Uf9pz+SEKlVrxQYcalhOMwBT/cBK4aBY+510nRT/8gxkvOGrKNFJCEAra7Og
         rNVKRpbN2s0/mYgT5It7uRGZVQSZQJgwpM8fYD61mif9x0HFwm8xq13UYqBKbUwHCOxx
         M/k860KfrXJt79FdSRXyVcttI+Px3KnfWw4Qz7B4gwha/7KADtcKtEVuPhOCynmo29yR
         G14Q==
X-Forwarded-Encrypted: i=1; AJvYcCVdrDbtcFbDrC2T4P91aUHchWTBedgS5VwqXG1J55P55dbvjV0mUpU4XoIuB/T6dlMYnMRYT5nMQuC5ug==@vger.kernel.org
X-Gm-Message-State: AOJu0YxLbZvsghEWJ+paEBii9/4ISwyemMV1FEV2m38uD0pb5Gn5Q0c4
	N8Rxz9nggeXkARr+lxp6uGnzXsW0AEVKhteLyf4y/zwOo4YsNaeoFtjYX+kR9Zw=
X-Gm-Gg: ASbGnctkPhStGZtwKk7rUtyQu1ePA3t2gkCFBzlBodE4sJKhHnDKBrfL/a91FMTmkyk
	Pdok+G3naUP6sRh7Yy0eWW5z/67Gs2vwS1VUBMR01QKrTTowL54McpbbFY6JE4JGRlYOTA8zlvU
	cq7O37v7R2lpAdK9SY/k7lQL15tnm8Etpv7H6OrrJSckSMEsHCFTKQP3LrtlxryNkzWyQ8ecaH7
	yR8LiXRjzlOkweuWsStJF0kqMh9+hDBY+pNuwQ1HSU2o+3GNhMT9mUdCxKD3hoYbheJWwbtgGuP
	IhZVPN/Cpc1BJ786l9U3ZGN/dtoDYIzMY6gErVMCbjSMUHgZa7HefZBd43Zb5Vajioj8HqFCV96
	u5X8KwilIpxgedYonkxUALhv8ZK4J+YYD
X-Google-Smtp-Source: AGHT+IENsPZ/AMQVPFzwdzV24c1hYE73gMI1F84hexuGBFYoNLNqWR0VXSlco8GETzsjYyrN3LMd4Q==
X-Received: by 2002:a17:903:1252:b0:21f:2e:4e4e with SMTP id d9443c01a7336-231b3970b19mr36155395ad.5.1747299200653;
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
Received: from localhost.localdomain (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7742f3csm111237665ad.99.2025.05.15.01.53.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 01:53:20 -0700 (PDT)
From: Chiang Brian <chiang.brian@inventec.com>
To: chiang.brian@inventec.com
Cc: alex@ghiti.fr,
	aou@eecs.berkeley.edu,
	corbet@lwn.net,
	jdelvare@suse.com,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux@roeck-us.net,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com
Subject: Re: [PATCH v7 2/2] hwmon: (pmbus/tps53679) Add support for TPS53685
Date: Thu, 15 May 2025 16:45:40 +0800
Message-Id: <20250515084540.1558914-1-chiang.brian@inventec.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250515083706.1554823-1-chiang.brian@inventec.com>
References: <20250515083706.1554823-1-chiang.brian@inventec.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On 15/05/2025 08:37 GMT, Chiang Brian wrote:
> 
> On 14/03/2025 07:11, Chiang Brian wrote:
> > 
> > On 14/03/2025 04:28, Chiang Brian wrote:
> > > Add undocumented tps53685 into compatible in dt-bindings
> > > 
> > > Signed-off-by: Chiang Brian <chiang.brian@inventec.com>
> > >  Documentation/devicetree/bindings/trivial-devices.yaml | 2 ++
> > >  1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/Documentation/devicetree/bindings/trivial-devices.yaml b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > index fadbd3c041c8..c98d69facb48 100644
> > > --- a/Documentation/devicetree/bindings/trivial-devices.yaml
> > > +++ b/Documentation/devicetree/bindings/trivial-devices.yaml
> > > @@ -380,6 +380,8 @@ properties:
> > >            - ti,tps53676
> > >              # TI Dual channel DCAP+ multiphase controller TPS53679
> > >            - ti,tps53679
> > > +            # TI Dual channel DCAP+ multiphase controller TPS53685 with AMD-SVI3
> > > +          - ti,tps53685
> >
> > There is no user of such compatible, so how can it be undocumented?
> 
> The following link is the patch which I would like to add support tps53685,
> and I think it is the user of the compatible:
> https://lore.kernel.org/lkml/20250314033040.3190642-1-chiang.brian@inventec.com/

Sorry for the wrong post, and please ignore it.
Thank you.

Best Regards,
Brian Chiang
