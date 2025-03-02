Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3EC1E5713
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740932757; cv=none; b=UGnAA7TGgvf8fP/QJbSbi5OqNo0UtyGbeKY44xgI1pa0lYqrEa3d3clJXMX6rNUXVleWDlHPy+wz3Fyq+DbFalXEANhwmfzhIdjGGFFuqrOgwOF7adD6Zyq7XuQ2hRjRFYz5ND7DYh5XWHLrYksTKIqlY69M6dvxwqzuSueKYbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740932757; c=relaxed/simple;
	bh=/OJ9l6phgyDYFZVIbNpSv8DA0MLxX+jyZSiqHQnp2Kc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ORhksk1Z/2n7VIAeuu3dkl0gXzsORK417M4uaZTQ3C0FmgAG0tT81JSAjlFLc1wC0bX374+4MN8gP53WHvDSEo6NdX/FdfQWHRu1RtWBZzxxuLJFK7px1rDmD0a3W5LvZBj3SDe7OAFgflIGckqpK6hniKdlz15d6bWlBZg62Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ecO8CrvS; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ecO8CrvS"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2239f8646f6so9865985ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Mar 2025 08:25:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740932755; x=1741537555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KRzLn19cpTDexXSEqlJIDIlFJFLPSScKQzF3OK8T460=;
        b=ecO8CrvSoFlQVbIOSlVvRJZ7GHHDH75n5fymih7RNK0lZXBMOKSA9Tew7YvzlCJiCp
         GzcH04s4svTBPTP5ILskZRqOrmYYGfmeyHviAryEZb9Ix++UnpUeTdRyl0C3dc8Yhuyt
         mrWCbGMd5eqtahYw4C6BSMBQDzxXogkpF892kJ2NNIPnzR2OQF/3G0JBL6t21+cOdSsa
         ijuVFTvVliwfGtM1UCT6wA8yVKmFDy9QUx9/wlFTtvq5AVc9Ri5t00G+FKEeAZMg0WT/
         JrI+I/D9PtoAGfF9I6zD3RhjcGu9ad6Wv1XohznWZN+rTjMc6NmbMajAx8Q1r/e3JVhI
         Y1FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740932755; x=1741537555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KRzLn19cpTDexXSEqlJIDIlFJFLPSScKQzF3OK8T460=;
        b=dc93eOOu5Pi8ZJTQFM9UL/MtY8JkXUzyaCMQa8VKGP/G/BwJZkO74yXgTDBFMLaYBP
         xf1mwrUVX90OMXv+8L8c7aC0PLuS4sUmCuPOgPJTr9rOqhLDilde/ev9fQh5mSEOVANO
         2qQTn+Zkf9ikzBstJ1gTTltbMom4YahPRlhYs0Eyor62+YgV+AWXU69BPV2Ij2JUp7ZK
         DnTgtvWwy/HtgJL3CahN5cbXT6uUkHeOPk287s5E5fhvsrOahFijftd4VoZjQSpx0siP
         9RYx3tvivvW9vTq8D14VBHcxkejOUvo7bw3NIRJYmnBe5jkH2w1DGZ43wjOUM0RmQTvZ
         Knxg==
X-Forwarded-Encrypted: i=1; AJvYcCVSHnGQf6IWmsQYIbSTT0hLOLiEkkLuaYKACUktUEZUrBVmnxDBCa36JDVYPAZqVmlweLG06iIkra9zBQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwSz6sMrSKBqXGRE40VgfR7Pjx3/j7FV3h+kInT5cDHwcJGWPRI
	wQHRS7/z1W5tDy51J4zpqIbjIFUFkCvg5Tcb2ibYRWcr9rVhoW2x
X-Gm-Gg: ASbGnct9kLdS85OWmR15HD8FRY+wnuchTfv24xfVdYjswEIETDuYE5G7Yvp2ki+O+8q
	iu4V4FsUq+zqGmTYzxUQupXNSdRw06RRdLGAiA5rDoZ5hAT82UYHyYCNg+FjWlIrNYeuQFGvcOf
	MPHV9MdgMmOZ6y2iL6ut0Nb+5wC3OhSE2FoeCALCs7zME6w0m5LPGeSEw6NI8X5aVBq3UHgJMsl
	ydHbK4kdYUnxmMQKDbQt7HzpKnO4JO0rCKq1v8zbjZ/LIyhVsTTOLh6GKoZRYjUItOUUtjObvhv
	7KGNVqqMOfNuhv6VS++uxBMa2ZSTfMksP9L4lHCYoiM8O+dol8aojssP9g==
X-Google-Smtp-Source: AGHT+IHUQIx7pOOWZxUGz33gIJIuLY4EYV/6TvWWRaCqoMocyH1gWX2yUnuhssWKVus9YaMn/pzDpQ==
X-Received: by 2002:a17:902:e54a:b0:220:bdf2:e51e with SMTP id d9443c01a7336-22368fa90cbmr168131835ad.26.1740932755613;
        Sun, 02 Mar 2025 08:25:55 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-223504e4f64sm62519895ad.186.2025.03.02.08.25.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:25:55 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Mar 2025 08:25:54 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Titus Rwantare <titusr@google.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus) Initialise page count in pmbus_identify()
Message-ID: <ded20709-c65a-4133-bfb1-d7730322cec1@roeck-us.net>
References: <20250227222455.2583468-1-titusr@google.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250227222455.2583468-1-titusr@google.com>

On Thu, Feb 27, 2025 at 10:24:55PM +0000, Titus Rwantare wrote:
> The `pmbus_identify()` function fails to correctly determine the number
> of supported pages on PMBus devices. This occurs because `info->pages`
> is implicitly zero-initialised, and `pmbus_set_page()` does not perform
> writes to the page register if `info->pages` is not yet initialised.
> Without this patch, `info->pages` is always set to the maximum after
> scanning.
> 
> This patch initialises `info->pages` to `PMBUS_PAGES` before the probing
> loop, enabling `pmbus_set_page()` writes to make it out onto the bus
> correctly identifying the number of pages. `PMBUS_PAGES` seemed like a
> reasonable non-zero number because that's the current result of the
> identification process.
> 
> Testing was done with a PMBus device in QEMU.
> 
> Signed-off-by: Titus Rwantare <titusr@google.com>

Applied.

Thanks,
Guenter
