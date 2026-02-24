Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE463A4F40
	for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 15:36:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771947383; cv=none; b=l16K7r1tyrxrNwL3uTpjy7iO69d0ptdk2YAVAtWQfyqdS0kqlycDRNkGYxzA1popPCjOXjSclvQMr3eEWWS/Xt8oOgSFM4IfIG5o+bHzrrJxaRs+4WcBz+y3kEEz6tHI9bpg5zoTIQhUAbE4/X4kEdFtGQnonKVa8rNhjSM4myI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771947383; c=relaxed/simple;
	bh=zkHGizcSxrSe+SkTAhDf0QJI9pxLq5PTMLmpw9CcwM4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b7t+LGsnOo5DYp7xvuY7C3VGVh5OywpCWzPvAoB1Pmvotf89iWOJn2ZyhPWCDp8sIbYIrLY6767wiM2ArvjeZ5bc+AP1N3mfISq/q4EB15RLqS8Hexy2Gwx9Hy8buv4O8lw0P7OEDE53zdMHO+pLT785NpSKyM3eFM9TN/8XeEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V89Df0sM; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V89Df0sM"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2b86ce04c5cso174014eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 24 Feb 2026 07:36:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771947381; x=1772552181; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DWYKuznTXu6LTPchE0wWFH1RbEKaWRHjh/hMMhxoCRY=;
        b=V89Df0sMCre3aGWcw2yNtP0yXl5P5YgoXHWcQlLKcD5CCm426EjM0y6UiT9pk0Nycf
         1L1+NKGZi9zjihhVRcf3zObeDppO0HjpxEJ7cDxoZDRATvs+MBs+sXlwmYIJg+riySuq
         Z3McZEywoGw7ybksPKADi7gdBfqKYEbr0JUIWR6tYLq4C6r1pEkTilC2nLnZsxm7CEL1
         0DVtONsVyGzO7G6v/H78uEia+rpwMG3VUTNOdKaAolZoAPMKSJCituRPEZlG9M/Elof7
         MJVGji97/cwfy51zNJcPVSUkhoLJxh7r4leqWGgAYdBgk4MPR4vSbIDOp49tS/RtYnQr
         8lSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771947381; x=1772552181;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DWYKuznTXu6LTPchE0wWFH1RbEKaWRHjh/hMMhxoCRY=;
        b=O4ak8s+lkzclieo5aTRWrG9YUD2CoLCmvYv3pEmQw0PQ/LKSnTKjgFGeNifiVpxXpS
         eqyAshvpf8Eb4qAKiF+9dsfhk1BHiRqFOXyviGgo7wF7XzDpYTbjSKWYPuB/6BsuIe9D
         cXF7jCPFougNHCktkLd3c/5qoKtWksBERnGOHa6In1OxP7Srx+Q3cfCRbjRJMdq0dDRT
         dgXlxn2rlpuo3vFNBEpTKEr8msN6MtjAFdEXA5CUjC+gu4PFd9oZ6Ewy6ZPuFtq+5rzz
         mE7qNBBwSAa+pzqNWyiMMAeySewI943GDidlI82Hd8ToMziRY3sPNUb5Mp3Hm0PtpW8f
         EoYg==
X-Forwarded-Encrypted: i=1; AJvYcCXicai+aXzWLOAVCPjSFEt9k5nc4Rv0w1nYjVfy5KATrNZF/Va2iRSkHHQNrY3zqC6pYYZFYa8DyyzlZA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyHETNrhs+r0Z8vVZFbwrN+VjQD+BlhH63XIWSqJSrgbsGB6ev5
	qgR6faM3fHFHdnCzzRyznjrzrVKYZWmsI3W8qIxRjnnWM93QmJY0GgqkTSGzYjsU
X-Gm-Gg: ATEYQzxeUSim0PD4OuNWBc6UH5+mcUKqqxPyzTu4a5SKoalWFO2lCIHOqdz0kL/LuwY
	xZcxADx9E0daYUZqXnVRTiNpsuqH3I3Gbc0sQsqvvNTNigru9FODVd70qI/gGFk8EiKb2IKb8fw
	k6WIN6XSCr71xm7hvIAV9EpdbMUdu43ZaQGnpCZ2/EoedzUWS1SeQudgbYINTu5kGsrntibS548
	JiA96qO1LXm8plkj9JGSZFOmWqz/x9UtG2jVW055o4159aQWkCK/u3iAbaP4wK7qseX7gMe9IQz
	80rww5xG8uVB4KwYL1P2ekmZ9kbxDAu9htrtMwWArOrHbVr4iIu5fJiINhhy5YzKqa03w+OHH63
	nQTmmqodJslNSAU/WUiLx4YruPNSy3iNsJ8RnhdIt94RQKSXATTkllxVaR/fQ7u0rOPGb6aLErg
	z2dJmigcv56DwYv9IXyQAHHxGmL8GRne13Fq/8
X-Received: by 2002:a05:7301:434b:b0:2b0:571a:28a5 with SMTP id 5a478bee46e88-2bd7bd2aacemr6348857eec.18.1771947381249;
        Tue, 24 Feb 2026 07:36:21 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bd7da3eefasm6934968eec.5.2026.02.24.07.36.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Feb 2026 07:36:20 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 24 Feb 2026 07:36:19 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ASHISH YADAV <ashishyadav78@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Ashish Yadav <ashish.yadav@infineon.com>
Subject: Re: [PATCH v3 2/3] hwmon: (pmbus/core) Add support for NVIDIA
 nvidia195mv mode
Message-ID: <c42f58a1-149f-4d61-9c48-0e340431b9a4@roeck-us.net>
References: <20260223050804.4287-1-Ashish.Yadav@infineon.com>
 <20260223050804.4287-3-Ashish.Yadav@infineon.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260223050804.4287-3-Ashish.Yadav@infineon.com>

On Mon, Feb 23, 2026 at 10:38:03AM +0530, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Extend the PMBus core vrm_version handling to support NVIDIA nvidia195mv
> VID mode. This adds a new VRM/VID encoding type and the corresponding
> voltage conversion logic so devices reporting nvidia195mv can have their
> VOUT/VID values interpreted correctly by the hwmon PMBus core.
> 
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Applied.

Thanks,
Guenter
