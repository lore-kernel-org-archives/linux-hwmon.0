Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5349923817E
	for <linux-hwmon@vger.kernel.org>; Fri,  9 Jan 2026 17:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767978293; cv=none; b=JjZlEVcCm1Coc7DujDJLAOC7BYM8WYim/201QCXhJdV4yh6o3JXQXTfUrwsFFKg0dPAF+9YM+l6R1vfEBNlnPm/hddqOC0MJ5TWWR6/wkWuvxoigWeqZODAkKE/EoXMQjO0f9c9a0JEjCW/H+mngdOvqmtG6MnBaGdF1c8F89Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767978293; c=relaxed/simple;
	bh=g19y3Pinpki+o6XOEwFbT67F8PX/sLPM0/1a9WmIq9M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCIxwd7gaUWukG96qTw+kcARnyMReKYZ2CfF+W6gT49BoDZl72Lp0DrbG78DC6ECql08ZtPMZnlsUBVIQM1w7/SC+1n3BkZy37rZN8K/W+c/dwRxst0Z/4K2eK7PHxdhqVMo8mE0/RYWyzi/Skus3w0dJtuQzU83Nhybt6QxS9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G1QLIF1k; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G1QLIF1k"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2ae287a8444so1609706eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 09 Jan 2026 09:04:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767978291; x=1768583091; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g19y3Pinpki+o6XOEwFbT67F8PX/sLPM0/1a9WmIq9M=;
        b=G1QLIF1kADYnet5aNvl2Iubzrfzp/slN8qNHhAWSGdLgdTs/GZfYWQbuIYtTIZfXXW
         MsRN9orfHyX3ZsqpDOiSPSdYfJ9Jvg+EYyXp9Mki7TSElPcL9D2YBuDu5kwITGnzeGZi
         VuFVpKw247lIXdvJTrxkACaLvQlhm8IHPgUQdA3OUG3+Hsw8XXEzevIqBH/54o0MvZ6+
         0hH29xvq9TuMjPY+wGcjU9kbidWoWEZZHzoZAaa73t6YBjvfIQb1eri77tINEV+R5q+n
         ZYKdiUHTaPhNcQ/RBQwtIWraVLWwGrNPztf3jy3cgvESFLt+yNfIOygOxB34z9ElUQF6
         uPuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767978291; x=1768583091;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g19y3Pinpki+o6XOEwFbT67F8PX/sLPM0/1a9WmIq9M=;
        b=EWbD2PreKuNGLf3hdCu8Cazh/Ot1ton2fnVkoW/K7J3NrGmEBHhr7uJI1+4DpNetDr
         dgHrR/MooFzlWQaKaQnu7cC3kepNCAOene7w2KHaxqr89AZX/+7iSRxhe056BOh5gjwP
         P13Na2SfpXOCtuMAeE66BN9rdElT3Fa7xXGlz000yxN3OA5jT+4HCWPTxI1OsoGkDT+F
         SMUC7Qj5meeCMhiCKwUJfmps32FkfR644DzXgctxzMMWNsEKOGORFHxgfdgXYBuq7sLf
         sPf3pFMZknv/v7oev2hgCGvYzy0KLdGUUTd9P5zqYM4FM7oDX1TkW8sg9OAedAtmcuQq
         JjDQ==
X-Forwarded-Encrypted: i=1; AJvYcCXQW8QoBlxnFPW4aZk4i7mCzoGnBPLLLNinob5n/e/yNM++3R0aoSh1dotY2J8qS3TSl+2bHisbCcDoJA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1k7NJ/GmnyOSZjBd20LJf+tV585JssVLZBZ5x+fgSxlhjTJai
	Lq3DVfvGv8giWWQtnVWV4p2F70htEnwZ4aFm7Lap4k3DZjWQ7QAwbbce
X-Gm-Gg: AY/fxX7GDUMm973IwKXinCMTd2wLXwRtclFEpM8s5C/IdBRR9Wm8TBQTgi2iFr0ZxqG
	oArygFbFJmZpuUtXQS5CAXA9MmRZt60l4Z67ApunnRtZ7VB3r5laNyaioWRhc//UC7Gyr2wEe+W
	xrEDBCVana+sqLlH4Z0y8HBNxuF8pQnoOgV9aHVYQGzwNjqK4eQ+0yTMcWuIgHLfabVmgYuoCUG
	BwFnEMjbiff5Mxg4vvdflFg+yPDlcu6Ecc1QfIMggkk8crb8nznWUbfsUjwbM+PvLXP/Uoi4Qg0
	KVgEDlT6ZCzB+6k0ezGatztnbGa0y6vzSoov7I4MccJtMLu8ByC9Qh6rV4Q+WD3aLxgPWWrSB9f
	6KP0Zp/VwM90o7iCuw3UNpQ8uAD2P9wVM4PS9UAm7Qbpk+GWJ52+H8ymcH/R3l1ELCSk4S9gSKS
	7Mzlc9ZRUwh6bjcsq50VCTKQfUjRHP7F897s4=
X-Google-Smtp-Source: AGHT+IEeR62VuVpweO2BMJrkyIy4R2K4VlLCVmxys/C0VJmaPJE305Y3B/WE86okFDHKftoXnYRPDA==
X-Received: by 2002:a05:7301:fd0f:b0:2ad:a3d6:7446 with SMTP id 5a478bee46e88-2b16fe7a5a3mr7718350eec.16.1767978291219;
        Fri, 09 Jan 2026 09:04:51 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706a53fbsm11248130eec.12.2026.01.09.09.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:04:50 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 9 Jan 2026 09:04:48 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: "benoit.masson" <yahoo@perenite.com>
Cc: Jean Delvare <jdelvare@suse.com>,
	"open list:IT87 HARDWARE MONITORING DRIVER" <linux-hwmon@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH V2] hwmon: it87: describe per-chip temperature resources
Message-ID: <8b41b22b-4105-4570-ae30-cceb1bd41584@roeck-us.net>
References: <20260109101504.47515-1-yahoo@perenite.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109101504.47515-1-yahoo@perenite.com>

On Fri, Jan 09, 2026 at 11:15:04AM +0100, benoit.masson wrote:

Patch description goes here.

> Signed-off-by: benoit.masson <yahoo@perenite.com>
> ---

Change log goes here.

Please refer to and follow Documentation/process/submitting-patches.rst
as well as Documentation/hwmon/submitting-patches.rst before submitting
any further patches or patch revisions.

Guenter
