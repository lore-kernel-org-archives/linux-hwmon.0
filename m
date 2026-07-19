Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C6C420C029
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 13:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469023; cv=none; b=LbpWAJOBi018Vnhz7ysMFXFybs24+DHZm58w6dIqWaJ4Ny2uUYEBoMquirwMck0ednpHG1lVuDL+Ir61Mx5AryNvee3mmSKZa17rO/UQ0YoJsQ739nfvbycCsX+ZRxWy2bGVAyAEQVQGzqojHo3eU0GUWNtEPmhVtQreeml+baM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469023; c=relaxed/simple;
	bh=by/8E2sg6NH6tHNqPxQwiAzOUhH5/GI5SGpLSGY4hrY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UFvPmgvYBu0u1HPM/b28+SmztZaJKcO1eiz+VONWBkWfsM8gUZnqbY5TEhtSBuayuyVttKqOGzgohuLl5axb4CHC/lMHak4/V5rmijuexqIgEpH22I6vXeNv57tEFfYRZFTD6KdMgw/8m8qbdiukdvZj5yodZDgZlrY9I9EjB5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hZiwdsJj; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hZiwdsJj"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-382ef647e20so8743451a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469021; x=1785073821; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=orC1d/ry4EDJvubbUTs825XTGt9QUdyeUeZHc5cnAM8=;
        b=hZiwdsJjpdFN4JF3ezr+qxlZu7hXZUwjlCLkzQs1VoDiejQI5g1O9SGakeFxTqe+UZ
         Ll0O64zM6n/Baq5aVD90m4Df/8u0mutKmCRIebjvaVuZFIXo27/xHd6mKR9V0M//9wWb
         UTaSwEMRWSVxMt/rMwe31zvoa8EbKAysFTi0UUXLBQVV+tbm/rkJxPCGapEklzspQW9J
         Eq82thblcCU7sxJYDwNBO4JiLHSalPugEsy4tHfm0nWuHEXz1FK8xm11dAxOVejrUe06
         FTwxAMbFq3AUA9n0jPXi7q5f3EKJhHk5OiC5lW1oPxM3k5ISXQV2OdUXjXQ+AyK3ct3o
         W3Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469021; x=1785073821;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=orC1d/ry4EDJvubbUTs825XTGt9QUdyeUeZHc5cnAM8=;
        b=LErEYpdRf3N3omlttFf7kQq6wHts4LCe5N8uVXruApa+Xad2eoiCadvXmW4ATsejTr
         iNhgykG8fDYwIWufa0thtS3ozl6dEN6m4XkIWHEjMxlCp1DIBHMwHSR/kd5fy+fNG0gA
         dTHWbW8uRPniWS18gLFpTp89FeF8SlOnFEdjyW9GnvctmQ+LM2U49KaL9D2MfTWBwqf2
         in0ClRI//+nbYfgoR9EA6RAjU1Wt3ZEtPaXD8uVflMkb9Rl/Mt6NsS/PQdLjGFA8264N
         3E/NCAudMGJ8jNNpPGaTYUMaJxcgnvemaP28tDs0blLmJ43ezFwYUPOA9VATKSazl51f
         LESA==
X-Forwarded-Encrypted: i=1; AHgh+RplsQTb/5q3wuFf1xjZaWRlwbfqk1JyDUO9/VUFPftdmfQ1fi8stSABOj6vzLYyH78aFbilIcs/TrhsHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVgLoKomnI/GlMDoKM9N45X+Fg1FaDS9aLM5MY5IySN7eHyypq
	28XmlHfpvAsRtpZH7QFrUb782Ww17qPCUx8+gvx5OOxNPLWJRl1ogGF0
X-Gm-Gg: AfdE7cmbwHqDxKq8pJLNJywtQ/0aXCPeCsBxujlLwnVujm87YbwCJkRZ2G4wgtxd9/x
	SBU4yekqmqfRMJZxY3BxXdOMmpCRNXrAXQ1jWox/THDciWhusRo2/bSAbDYC1zAV2ZZRDx2f0Ur
	z761Cp67XOsFOwWsHaHqVRWBveh+HVHOgRipXHN+SoSWWklYM5Vu84uc/9IvTSnCcdhywLqt0gl
	Dr0UN9SzqjDC0pIWAXt2BrE/tr1b/s5JxPhhrkguNjEAycdlE+BdVMWhAPAsmOZICy5csTa0HgJ
	avycGlVHZT3E9K3MsRcj6WgXK8PrYxsRPR2iZLOhjVn9UAPshpp7lQS4aNYSX+g6fFDmvULxKRE
	TrQ77ZJnSdJeOvfMLgAAUdbHOvJyrIeBu88XOjaLfGiSeTo7gUvvox6kAD00jjs7JYT81ByU5B1
	OtduyoNgXhvj7Cqz4=
X-Received: by 2002:a17:90b:2f85:b0:381:a766:efc9 with SMTP id 98e67ed59e1d1-38e4b4227b8mr9496688a91.7.1784469021299;
        Sun, 19 Jul 2026 06:50:21 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e39de7875sm6106250a91.2.2026.07.19.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:50:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 06:50:19 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pan Chuang <panchuang@vivo.com>
Cc: Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Jean Delvare <jdelvare@suse.com>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	"open list:AXI-FAN-CONTROL HARDWARE MONITOR DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>,
	"moderated list:ARM/NUVOTON NPCM ARCHITECTURE" <openbmc@lists.ozlabs.org>
Subject: Re: [PATCH 1/2] hwmon: Remove redundant dev_err()/dev_err_probe()
Message-ID: <2334832c-fbc6-4356-83fa-1e331e5ebea4@roeck-us.net>
References: <20260714130228.449233-1-panchuang@vivo.com>
 <20260714130228.449233-2-panchuang@vivo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714130228.449233-2-panchuang@vivo.com>

On Tue, Jul 14, 2026 at 09:02:24PM +0800, Pan Chuang wrote:
> The devm_request_irq() and devm_request_threaded_irq() automatically
> log detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() and dev_err_probe() calls.
> 

One patch per driver, please, and provide a reference to the patch
introducing the error message (because I can not find it). I am not
going to spend lots of time trying to figure out if this is real
or not.

Guenter
