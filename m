Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AFD83659F4
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Feb 2026 20:09:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770149348; cv=none; b=EjU0ELw1mqwAtbmMOx9iNU+Cu7GKRWmy0OftunwJJK6EUQ3kQvou69DjnzpzsmJx9ZxPFbvIjQJD2eemEZjPb1CUpOMzlc3sTtHAMisb8wcjUiWbyKQV5kSN/nHqQgPVSNbZOR09U4+4J9zaGtgUPmYf2foPNUClb4BdESHIkMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770149348; c=relaxed/simple;
	bh=KXmsqY+Yl9J6VC7C3sRoq5iSnXOF93yU2uJPTfo6GLs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NKX34qDfr38FyvzcoEgskh8F+hj9RsvHj3ATRkHyD8jMSMm0nNTmsViyETK6Tt7Pr77WAb7PwWOgtR0rOn09XbUpwgRarK5mZldK5HM6OXFD5kwKWcsJAM3igLl7MyEtxzf9wYI0wfzKDDXZnNJnQLLsFTzD9+0TKdfOEsPr6Hc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EKCY9pny; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EKCY9pny"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8230c33f477so22700b3a.2
        for <linux-hwmon@vger.kernel.org>; Tue, 03 Feb 2026 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770149347; x=1770754147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tVQhqA97aNi4iwum9p1p2SwQkrduofkl+pPHMaPCBPM=;
        b=EKCY9pnyCnAXESn4UGgZ0nOZG3kiGfVHstEsfYvE+ptMkDRD0QcgRAvJcp+kvb1W3J
         TOrIqLUFES/nwzzvD9shzWxNQih0TBfeaikD4e5Tmxu1xq+SB999q/RMNHokk5p2DhiX
         oVqf5mpnxZiA4Pbrb9TIRo3cEeaH7+rAjdDGZQDBhUj3JETIUQtt/Log1qiMUrsOcO07
         ci3HaCooruZFdSV82+E82fB8i3rU4s5w/CpLo4afUSWBKSS/v+VBCLYkdt0Yj6nM+44C
         qTG+BfjFU6alalAY3c56cYC3Ms6taxhVZ5SMWlX8PPxWybqrQRNXGdY80gBms/Gcw5u4
         JGEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770149347; x=1770754147;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tVQhqA97aNi4iwum9p1p2SwQkrduofkl+pPHMaPCBPM=;
        b=RnxrYy+FFev5u7zputUGFR1aVkKcbXR2DYbUcgt9glkXFopBqckDVSF2Jzdt4eaz6k
         vhKPnzMq1AqJz5iGIbJrna9ezPLPM4f+7ZDnCuL5tpNggnKulxfQ1/UN/BUqyky9CWLt
         9TfO0F+Sbq8tTiTHTZ9P9pB27kisndD0YBe1xLzHoG6MyV8U01qczdtQldaV9F7Nbwi5
         t+mgpH1nmXi4zt1TsjsRL6XrffF7bgXcvGotnL4Cjr1CsRxWjjQ7frr7/5m0PrJTP+wv
         yOqPAug7EoxCMEabccrDftOaEPBUACDGookxtcnf5imeCv99yzS1xik/jqMStwPoq+Wf
         WOkg==
X-Forwarded-Encrypted: i=1; AJvYcCUzneJq6fFZaEhJaahtFa+yYYK8YZ7sNqu49STNcn78Pm5xlxawdB9wIdNYYauIyAYvl0szLoy0IXjLUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0VICWOt/X0nVrf80wAP+wiBAhpCX2PAKr8g39xvz5oboofmI0
	ASySwXZfo6J2bfpiNhk9Bxem7v/0t79BF6NyIs4OAiOn3wTEa50FkzgY
X-Gm-Gg: AZuq6aIBBmMeUIxDSSradjwM4QRCAxOdjr1qKVvD+aNJMlZZ9Awq6v6CidQmdqfAfGP
	IxUnF/iIhe4ShpbAY0793C+PPG7FNPEoD2HhSvE2Bp3kOqwDdzgfhmlKA6SvrkO2LLRUds2Ewty
	V8CMl0zvPvpkQisF8KCT7WtLAPtdJxhZIc6oJ1nWPVNdMAlgon9QtwLENDI+Hna3T9NR51M3J/U
	6cXQVIGPcd6TcdKGbE2UP2d0goIvXyYCIGXKXQ0NOYE5sSGek4IkI7zpBNiCBJ4Xn54AEHnLp9t
	f1hehuz3pQ7YEQw2qGllruHJujcyOy8cswLAlIc9yAKjcozcPmruFFpRahDzX5C8BlbkSz6YUOJ
	hOjGeo/bRrck45iJojUlTqkIMNZhcAwnLSxyAqBJy0OtFSXIJW88cmrpXa/TsTAiUePxLRJ7j9+
	0FES9+smh9ZPNQ+UgGJgBQHjuL/TLCH39wloE=
X-Received: by 2002:a17:90b:4c51:b0:32d:f352:f764 with SMTP id 98e67ed59e1d1-354870b1e6dmr395651a91.2.1770149346689;
        Tue, 03 Feb 2026 12:09:06 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35485b77664sm479374a91.0.2026.02.03.12.09.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Feb 2026 12:09:06 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 3 Feb 2026 12:09:05 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: victor.duicu@microchip.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, marius.cristea@microchip.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: add support for MCP998X
Message-ID: <fb5fcb40-1cce-4de8-83a9-c8a7f308505f@roeck-us.net>
References: <20260127151823.9728-1-victor.duicu@microchip.com>
 <20260127151823.9728-3-victor.duicu@microchip.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260127151823.9728-3-victor.duicu@microchip.com>

On Tue, Jan 27, 2026 at 05:18:22PM +0200, victor.duicu@microchip.com wrote:
> From: Victor Duicu <victor.duicu@microchip.com>
> 
> This is the driver for Microchip MCP998X/33 and MCP998XD/33D
> Multichannel Automotive Temperature Monitor Family.
> 
> Signed-off-by: Victor Duicu <victor.duicu@microchip.com>
> ---

More feedback, with compliments from Gemini :-).

[ ... ]

> +	case hwmon_temp:
> +		switch (attr) {
> +		case hwmon_temp_max:
> +			if (channel)
> +				addr = MCP9982_EXT_HIGH_LIMIT_ADDR(channel);
> +			else
> +				addr = MCP9982_INTERNAL_HIGH_LIMIT_ADDR;
> +
> +			return ret = mcp9982_write_limit(priv, addr, val);

Pointless assignment to ret.

Thanks,
Guenter
