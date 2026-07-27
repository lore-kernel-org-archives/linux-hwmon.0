Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A65D241B8FC
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:40:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163232; cv=none; b=hHMTae+LiQFKzVBA4XqBOCmQc48kqdB5CU5jtVxcvGiqPRJmGmqhUn+dKUcHSntNlPitvYpn3G7qNAMzgj19daiyntYNydee56fv1iTcrz8+aQD+2OEm/filDliiTEcQip3V3zPSjE0Qe6htmh5SWgBmEqJlLU/mGtpfq0Mvx+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163232; c=relaxed/simple;
	bh=GkGLWRBVPs/nmA3hEmanxLkmBU7gAjvtEPfAEMBLiQg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zre4hcmGWbTrLSJ49v7eGiolUEQzfJqI1dp9othiEMOu6ItHaQflOQtSQedIQfhKQasdJj+485eHbKMSe/1ocXBaDkMve2UGOKvamTA1n8TScEVbIXmI2Bfc/ey99Hhm/YXafgfRBHuLqcVpMQHyxKW0ft5wrTSsegyNujU7+Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d69dyCDv; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d69dyCDv"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-ca913a601fbso2038000a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:40:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163226; x=1785768026; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Y7GYu6iHHA83MEJE5lfFciA6n+k6vBppJrk9mCjfmqk=;
        b=d69dyCDvoPYBpcDdffOzicZIx9W0PFkQ/thfF/v1KosfF6/FoYt1oW8cX3/FLaHN76
         aIRaWl9l/y4qheTUZWQVI+trlrEiqn30+thsQAsD+1ca2BE7AuWHc15LjYk+U3kKG/he
         og47HS4eVufjcu1wl4ohKMTbJp6M9qKpharYbahpHAUTsFABzDgx7f1ZxFOda2yRk5gA
         VBnUmS+nfGoTInd/F39i/mRwJC+1BaQcQbvvn7cQTPcF3mIlyug6pF2hH5Wtu33Otdi8
         fD+jGmiKq34cRZhTLdfNPRnRpAUvWzF7fhI6xFClcK+XQf3dYGmPkugD40fdMTkbjqe7
         t8zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163226; x=1785768026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y7GYu6iHHA83MEJE5lfFciA6n+k6vBppJrk9mCjfmqk=;
        b=KVngQ/w/pFSPI2VHHZR62UAUiLn4dBYQq2OIyXSqaTxAMDR4X8J19vJCkRa5flsV8h
         XoSZFaHkT5XMD9E1zO2NtIudCV1T62D/7EbT5cXdhhmuAKmu5JCTzKVTePLrS6UnMa8+
         suRHW78oFlKo8veDWP7VkdCpIwwl/UijRLRpDQa1bXrigG6WPNfOcebohK1kpOpE0YdW
         c9S8LaW3is56SDfwQo97PTTrFeDOvPX9gG/fWi+9SAz9xxhDRu/etpHqYUc4DgQcVnbT
         X2ktufjgN6NMF2DZuFsgpS8nsEhCO4bVgFHtrIMgynrRZ9f7J+uiC16SH+NlMLWG9KUU
         4gFA==
X-Forwarded-Encrypted: i=1; AHgh+RonDKW3/Y40fGYcvB+tAjk7NeDIOIxT2Wb93Oo+7Hym07nS+fkHatasPqpr0XU59FUlVklFZOglZtbM3A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxs/tp7l31f1L4crIt0acfpra/zjDMa1Y2m3WhqKiiSlpbz9of2
	rd54L+bkduct4d6cxlZLXUXhfVUIOb5/NPNSL51S0hyTKan9MbdjNtVy
X-Gm-Gg: AR+sD11m+13AADWJVzwhsfdhpIcBP13qwwthTl8c3QAH65YvlDo2AwFAqQx0hGqHyEw
	m+l8xVZtTeoo2sWC/efd6nQvivBuiUTTRdlmnxucnmn4myPGKgGheeCi4zogAUS76DGlq2p8E/4
	DISxe8bJP9E123F9hXxUqQkSr4sieQaW/K9+SkCmVg89k4+0Qwk1x01OqmSkfTFchyXZftoAugC
	JxS6YyxSLFZKTe0aBx5bA3AJ1UvVhUy9ucb9L+qysBp+xcnW6Z8o7uoBXl8hmYx1uPGFoZfYwV+
	tRlZToHsPaQey4GloJ8aXndoPOSslFLeaY3yY/fyLVq2OrK/Cmx3geGceuVus+N+5PIaH24ZPDi
	K4A1ELBALmRkWpor9Ib1D8iVnop8YIihz0SDrY4rWJEGVBkgBXrIWSMS7vPQ07oNIMzefSfD//T
	jnsBbdlvWMO+eatWI=
X-Received: by 2002:a05:6a20:c98d:b0:3bf:6f30:1ccd with SMTP id adf61e73a8af0-3c67e071b78mr8053339637.42.1785163226131;
        Mon, 27 Jul 2026 07:40:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59cfb4sm32413945eec.26.2026.07.27.07.40.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:40:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:40:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 1/4] dt-bindings: Add vendor prefix for Kandou
Message-ID: <39ede8d1-751b-442b-bdec-b62368e79784@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-1-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:37PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Kandou AI is the vendor of the KB9002 PCIe retimer.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
