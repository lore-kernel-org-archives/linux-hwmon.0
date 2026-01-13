Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0879810785
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Jan 2026 00:02:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768262528; cv=none; b=rKFFjnXtuHgJjqBYUzOTVxy+u0PmnedfpVKQatUeN5yqxaKIsIkO2bwizVSMUumUBMPlzOPUckKR6guTEHtySgr0CgycWg/XNZCRpr0ECeaR8HzraKrwD/EbMPONKwwXtT1xIBEgdNVvWD+oPz4fGKYgr+nuOUBmVCRZ3ywVl/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768262528; c=relaxed/simple;
	bh=6Mg75/GsSNFskJG+FXgyTIlJ09ZbQVnhv4ijaYTIhwc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PYvzglzd+++3msLU6d0VDKOOhJAes+iX5wQhHGZEdmcoOPZLYOu9HD9IrloBxqJ54ahvGtwPhQGlTh+DiOIDpraKx87xq2BHyD+RfoM2gJUbGGdgdvj8UFXVgt9GL42Ke7+Rm29TPTdch3yb1jHfDeNriNmXRUrCCgk9ir1vq8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VHnZDvIl; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VHnZDvIl"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2af41f558f5so7354148eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Jan 2026 16:02:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768262526; x=1768867326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=tWJYpsY08Cfl7o0QEf0/I7NxwELdeIHRf1DXdyZsXM4=;
        b=VHnZDvIlOsPsWcH10VlzgFDVKTnTIHDBDslcZp8SMWOLHS853ORMFQUwpnaUwFYoM8
         4CqIm7AntFjcCkbOSR8dvat1rte2zf8INsURx6ygjr/IJpnrWlG7RZG72+JFktyaVJqn
         USLf7iuv/iutTKV4oolwY1NvylSJxPYgxVkZZbFCj0FVSculCKN9GX7R7ir6rtyxZ7Zb
         hsVrE58Mcufypk1CkLhq9hs5mk+ld7c7CezghUWxySCqOv8mpXkGpxL0+qsYOnLZCX8f
         Uk5FnqVIxZN0cv6dfkT8c4yzrbBW/mavfzzMi1L1kIiNOEFC/Ny6DrCh4qChonXcUtNN
         z/Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768262526; x=1768867326;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tWJYpsY08Cfl7o0QEf0/I7NxwELdeIHRf1DXdyZsXM4=;
        b=IE+4NUHSq2S2bmT3xNO7lwe61yaa2CRY2NOFzOL+cKL5n/IYaRAGQLl1tMiz7Et/Lf
         eUstcFGitKCB6k6ISg2Go6DWWy77CRUVqvn2xxPL8DoELcMgWtoDcRCrFHFjQ+9lasRP
         o01abhu4Ybvm2ZiWyZ/iVb3KUDBx4ZZ7P2M7A0EKskjXr9/rGiEh5c7onCqYoTtgCyE+
         8oHKezXDTb11M2YYnMHSJXZYERLbUvH9f9ODlwwWdlr8a8Ok19tETzkO4texV2fLKl0m
         EtDbGfiNotQ6MlgDjvqUiToLqBoB4SrGkZUPG10eLUN13p42ZNEailB93tb9NwV9pvAf
         0qOw==
X-Forwarded-Encrypted: i=1; AJvYcCVNcSqsJ1FYs5sPZ6cfSlixTualSkdtgH3hJUDmbgaOrieGw8tU4aQun30CLPnRco7+tchmRawyTlmFyA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0H4LGFqTl2My4x5pcX7XHAI46FpBh4suvc+sxaVPdLjERS0ZE
	/gp5veiA5h6IP4LZ8y05GzO42pClGxQu9WoLaJu1YkhM0lIWzVcJPF0n
X-Gm-Gg: AY/fxX5lyySH58w6GDGe/FmUh8dRPTCTdypwCa5mA9S79IUCo7ctwTISA/4Y5mRlwrU
	woi6CrKT0XpmxPclXITvhqSiNutjpfGMB9HMZ/EzvNhkmQ2XG9zTL+eZ+x9vqKQrRb3WmVTnoG8
	irjZsalk5rSwPVgs3UTODAz72ApkO73RpC3OCKodFGqucRFmvmS+A1R2mJlMjR29PbJykhKs1I9
	AQIR0Vj4cnJuv+7cB3jlnNgvnIpGkNNKOP25OvsLVAi5Jfglg9M+g5COk5lDL18K5NlLQ/Gf+xa
	27ALfH41bslWpAVVqjdtuJ0zKRINlCNEAY2SkgF2GrfXMjMZ2QjyJEsZeTjaEdnpTWI8w3dmHVe
	68exSTb4VnqAtFezPu9CrkucSMqAbUnEytIQYHrrEiBQr5eYQ1bgASNdZlupMYMF4KbO9b9THXa
	zgkQpNp1x+xr7a3gvcOB4ZF0Ev
X-Google-Smtp-Source: AGHT+IEUqdzwGoghTXcoEKp8rntqfE2E1B+5Bq5gyxLHAiW0nQrzylNwYjYPn6h9KO8SnlXLSGjX0w==
X-Received: by 2002:a05:7301:1116:b0:2ae:554a:64c1 with SMTP id 5a478bee46e88-2b17d30f664mr13390705eec.31.1768262525850;
        Mon, 12 Jan 2026 16:02:05 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b1706c503csm20136130eec.15.2026.01.12.16.02.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jan 2026 16:02:05 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 12 Jan 2026 16:02:04 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Laveesh Bansal <laveeshb@laveeshbansal.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (coretemp) Add TjMax for Silvermont through
 Tremont Atoms
Message-ID: <b2c19a52-3795-457e-a9f3-b23d86164802@roeck-us.net>
References: <20260106155426.547872-1-laveeshb@laveeshbansal.com>
 <20260106155426.547872-3-laveeshb@laveeshbansal.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106155426.547872-3-laveeshb@laveeshbansal.com>

On Tue, Jan 06, 2026 at 03:54:26PM +0000, Laveesh Bansal wrote:
> Add fallback TjMax values for Intel Atom processors based on Silvermont,
> Airmont, Goldmont, and Tremont microarchitectures. These processors
> support MSR_IA32_TEMPERATURE_TARGET for reading TjMax directly, so these
> table entries serve as fallback values only when the MSR read fails
> (e.g., in some virtualization scenarios).
> 
> Added processors and TjMax values:
> 
> - INTEL_ATOM_SILVERMONT (0x37, Bay Trail):
>   - Stepping 9 (E38xx embedded): 110C
>   - Other steppings (Z37xx tablet): 90C
>   Stepping identified from Intel E3800 Specification Update.
> 
> - INTEL_ATOM_SILVERMONT_MID (0x4a, Merrifield): 90C
> 
> - INTEL_ATOM_SILVERMONT_MID2 (0x5a, Moorefield): 90C
> 
> - INTEL_ATOM_AIRMONT (0x4c, Cherry Trail): 90C
> 
> - INTEL_ATOM_GOLDMONT (0x5c, Apollo Lake): 105C
> 
> - INTEL_ATOM_GOLDMONT_PLUS (0x7a, Gemini Lake): 105C
> 
> - INTEL_ATOM_TREMONT (0x96, Elkhart Lake): 105C
> 
> - INTEL_ATOM_TREMONT_L (0x9c, Jasper Lake): 105C
> 
> Not included (MSR reads work reliably, server/specialized chips):
> - INTEL_ATOM_SILVERMONT_D (Avoton): Server, Tcase 97C
> - INTEL_ATOM_GOLDMONT_D (Denverton): Server, Tcase 82C
> - INTEL_ATOM_AIRMONT_NP (Lightning Mountain): Network processor
> - INTEL_ATOM_TREMONT_D (Jacobsville): Server
> - INTEL_ATOM_GRACEMONT (Alder Lake-N): Very new, MSR works
> 
> Reference: Intel datasheets and ARK processor specifications
> - Z3600/Z3700 datasheet: https://www.intel.com/content/dam/www/public/us/en/documents/datasheets/atom-z36xxx-z37xxx-datasheet-vol-1.pdf
> - E3845 ARK: https://www.intel.com/content/www/us/en/products/sku/78475/intel-atom-processor-e3845-2m-cache-1-91-ghz/specifications.html
> - E3800 Spec Update: https://community.intel.com/cipcp26785/attachments/cipcp26785/embedded-atom-processors/4708/1/600834-329901-intel-atom-processor-e3800-product-family-su-rev015.pdf
> 
> Signed-off-by: Laveesh Bansal <laveeshb@laveeshbansal.com>

Applied.

Thanks,
Guenter
