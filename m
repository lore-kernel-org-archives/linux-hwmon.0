Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA71396D2A
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 22:21:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773786070; cv=none; b=X5LBH6fXD62xIc5Jy4mPsgsQ4YG+RkDWf5eIdLIwfim3gnMbwnJL+S12nBpfGnUDo/YIdZjfo8LK9dwWW4Eoc6GaDv3FRjuiD8/Kofdk5WFVURPBIKD3nBI9eOEYBY4qG9ZroMaF17I1v62Nf0RzIJtodB1ouWn0d/1lwZtkz4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773786070; c=relaxed/simple;
	bh=0Uv5d+5bbxOiBwF6M/B3VboB0yLE4Kxcf8RxYCwaTRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BSMW6aMBAcw5EsO1cMwwdO3hBsEJ7yFsY7qJ6VaApvHKrzwnotjZT1Pf0kdc5h1X8cwM9AHnN+/RKn5Agix3XLUhtjMZbtGYP6MIp5bh3nLzS2jYA3fX6KqXEE4jY9v0Ukyqp46/18V/yueACu34wf9VK85qYATtY5xCqS9bWcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F7AB7s4g; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F7AB7s4g"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso7508968eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773786068; x=1774390868; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WuptZXzFK4L2PdpOl2b489CN0eHGzhpdwJXoMDn53BA=;
        b=F7AB7s4gJVImSXktvFOgLyIwzHGk0B5R7JerD7UQh+Qo9e6yZ4v39A12FEgpMq1GMm
         mBkTVbd2RkMc58UKVyCQot/hS9sFerfbfsAy2jFEMmkrY3jRBpc5WpoWYGXlAmqbSWqv
         yquWa+xpctIe2CJOgFFOPXeeA8KeFqS4SzFSJt7Synzrbl2BNp6Gf8zI2Pt/r4mEv2VU
         YmZH9u1mweVrf8d86q359Dy6D0pq7Ti8q5fJi3rDNwpaihQSNLD0H31CVlGaM9TDe4ps
         rRit7AmPKOT2Cn2R2eZF8yklcLl5ep26nlo2Y16QsSZSd4ROfptXlaB1LT+fop5CSnZ3
         RXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773786068; x=1774390868;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WuptZXzFK4L2PdpOl2b489CN0eHGzhpdwJXoMDn53BA=;
        b=HfucevJ8MiadpPJRkvVybFVHyjeibvyocPPw769hhbnPbo8SAPOgVyJRQTO6/f0fJr
         +6FJAZiSAxf0j8Acyb5S+uhxxEGN06jNFlB03iFWFPZ/EDowQskRWPPGYcwQBH0Sa3lR
         0ahfET7FCw6TufjwvNnydkoxGbBhk8m3R0NtBQmI6axjkfoutW9xwPULO54ClOQFsZgs
         NS+eruS9G20Om5Z0sxv6OwhMOtu9AuHoubIGgNgximBJz38kE4SzRUMYdJks68yFiMxe
         KFLZl8wqpbElD4deyuDh6elcjZvSQ5vYNONuxQwzzp2L+UQYFO59NyvYkSqjGQdfaIFw
         Mung==
X-Gm-Message-State: AOJu0YzFwXb2vslgoN53y6d8CuDUxUsGYailT4e0WVpIOi90uAgXIPGJ
	1IDOgiQTCC9cQ2DimIbNB1ebIRLWjWcHWiBvaO806F0T6muwIKi3hOif
X-Gm-Gg: ATEYQzwhZlM3mVmgZYvB2q7GTI//ayxdqH2GkoAlPLV292CVpP5NPWDosyMtQsvAJFN
	g9AWfwWp/nSrpJvYHEXDVYHHmHsYsKB8mY/9TXFFw6Zb2Xj9mk4vZ5Fx2JpSRkwVFxLhAYkVXCK
	fkDk6ODIIVyh+AsRuyFRqN09ExPcy/c8IP9J9TqvgVShuXQBiOlfL2faqTn1XVpW46Sa3OIhhJQ
	Tw4Bmc0beOE8jm/DeU3UD1DpZC/KKBxxEG0rezfcHGjdawvSNPLXH8c8iZF5p3bTFCKgIKNSrNU
	+oseJITYznkhG3etyuuruJ9wIKnGg6jgtIMCJcRA8WYwetYsGU/nPin1D5s4bwWCAY24mfk5xZY
	g9xoXkawLt+3iwZ53TcEa6j0WR+cHGwqhZlZGu5R+DPE9WSiFdtG8sWpOhvYhpLSH3aznFZStJh
	J/pfb8gtDZJGjuhFtUz+9lIwVDJqaa9bvQEf+dNenwuZKJV0A=
X-Received: by 2002:a05:7300:cb0b:b0:2b7:19f2:6b70 with SMTP id 5a478bee46e88-2c0e51be9abmr465026eec.26.1773786068215;
        Tue, 17 Mar 2026 15:21:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e55a2be4sm1414926eec.22.2026.03.17.15.21.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 15:21:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 15:21:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"vasileios.amoiridis@cern.ch" <vasileios.amoiridis@cern.ch>,
	"leo.yang.sy0@gmail.com" <leo.yang.sy0@gmail.com>,
	"wensheng@yeah.net" <wensheng@yeah.net>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH 3/5] hwmon: (pmbus/mp2869) Check pmbus_read_byte_data()
 before using its return value
Message-ID: <964686d5-a9d1-4db4-be24-81b48a0db3bd@roeck-us.net>
References: <20260317173308.382545-1-sanman.pradhan@hpe.com>
 <20260317173308.382545-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260317173308.382545-4-sanman.pradhan@hpe.com>

On Tue, Mar 17, 2026 at 05:37:41PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> In mp2869_read_byte_data() and mp2869_read_word_data(), the return value
> of pmbus_read_byte_data() for PMBUS_STATUS_MFR_SPECIFIC is used directly
> inside FIELD_GET() macro arguments without error checking. If the I2C
> transaction fails, a negative error code is passed to FIELD_GET() and
> FIELD_PREP(), silently corrupting the status register bits being
> constructed.
> 
> Extract the nested pmbus_read_byte_data() calls into a separate variable
> and check for errors before use. This also eliminates a redundant duplicate
> read of the same register in the PMBUS_STATUS_TEMPERATURE case.
> 
> Fixes: a3a2923aaf7f2 ("hwmon: add MP2869,MP29608,MP29612 and MP29816 series driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
