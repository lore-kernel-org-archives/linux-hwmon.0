Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B0C368D62
	for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 14:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790344984; cv=none; b=NcQ1R9U1EuNPX+eGugbBXSqRTol3m4QOS+5knp+2cwzMXoDPgrPSznfcE7oUbiEy4i0WyyDqZgLF6mJXlG18vx4seLK2dKZrU5F5TDaUWGF52DXmcNkb6NonoRnECJb787RyYQc/OUZmBNEtTHMwtOpbxl0SKJsnQU6K/eYyLoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790344984; c=relaxed/simple;
	bh=VUC4l/F1r1/YFXEL1xQc8lU297sWblxuhQWuv6JfZsg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPjb//QhCZhoXYw4g9l+Si7SRapCpNQGJhU5zbMQPUB+srMR8B1fugvczMxX3qEIDXJPf1J3vK4lljPGIY0INYZds58HAwu7HMG7yVYjjBMge8Q4oHcjsIWSPDFBlNvoIN4qT/6upLZCz5rZugZ7My9wVMvSBe8Zp06jQVS+BC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FC/3K7+H; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FC/3K7+H"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4bdf8abaaso571978a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 25 Sep 2026 07:03:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790344983; x=1790949783; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=N69Zh7bBqUcbkkYmaE3n3pY4onWHGYP614jgtDR5fU8=;
        b=FC/3K7+HDVAKxtYKO+IDw5puanf3pRgXRags9DMJmmQ5ZS/nK+9bde5EVuamXfVyK/
         m4rLstN1GUWm+VvGv3WcCN0wcsKf3da/jKHfxTmjTCTCjpgGqk80/PZR5b4xwxWkAVEN
         BWtepbraY2Shv9kV3C4k6a4BFTFYlJ4QK/wvZ58UZNEIfspnmPcvWxKo4uxNVVZPOX1Y
         iZLUMp5PoSpZF9h5ANDkRLu3lVE7FUMCaUNn4/dQsRKYH5ohAzsbdT9HR5NDaT5HKxkd
         D1TFVSvYet4XRUEUD+JYd2BA/9VG2fKYeQtJsimslNZ12EOaWpXoWzpEaa1k9mxxDJCQ
         K5tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790344983; x=1790949783;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=N69Zh7bBqUcbkkYmaE3n3pY4onWHGYP614jgtDR5fU8=;
        b=H8FLFAtvrmd7BKi25N3OlxwQ7LgDdokurTiLgusxp3RZEe+rrD4xp7ySZxUdnPitxn
         +Xz4Q09f47yE/DnWYtlnsP/QKRE6nILKgofs/MTv6q8HoAjE2tvTZ569Dqo6+ioYleYs
         lvmgUsSc5G3e6n6ERaHZJoxY9z+DdJhSxzg/8JrxlSt3eztm8VlBdHhut5uBjuTb1Ugq
         bXf/XRg84n7Y5X2eF8ioYES7a5eRbe59AkFYTuhPaJJpLLerqwM/LarFWUG9fNGY5h28
         k57pPWfJM0jJNNrGN0dOhGGPDIe8higOQhC1ml7MceTHNPZyDP3HPraq9RFXEHqy533A
         /1Xg==
X-Forwarded-Encrypted: i=1; AKwUvBzXjHKHyl5QYDG2lJX1b7OlttA6Fb7rn/QUFg24OtrGilW3ukf4YzqR+1uL6ANePYT+kc9CnuZnFDacRQ==@vger.kernel.org
X-Gm-Message-State: AFuF++mLcA38bmOQVtW7TMe3UZn/l+r0RLntrj/SIU+UMKndFV82846s
	JZtBgxEmCB1Cz0bLp1HEMx75OMnCTT7Wp9RSBCa1m4xr8q8bQLKYIOtm
X-Gm-Gg: AYBFou3RFUu0HjElVcddubOuRJMZCsG++veDrAbUXEYsknMTQen0OgbLk+Hxc8rlUiZ
	Whet4+oRtNqcI6E2FSSKOnaMUHQ8fILxC7Hfl+mOhehpvMJBTSusTLQaCk6DpjKsWp+7AC1PHhD
	Far1N8WoQGfdWi/pQ+uI8Tzdae9PFfH2WXlzXas5XC7yVffWml2fiufh7nj4AybSt0cWAGlI3VP
	92UxbhSYV5zquOr+fIGnfUzDS4vX/dMw3NDUaA2+wxRnyixnGnr5WRjYU/VDWZ1Y3b7w4G2AtYi
	bQlyj5BbCfQk+VTTjivDlT740YC5UtLpo+SY3cLWH1rvTFnXNf1pDmyh1NO1OLg4LqLKPVNHZFX
	avdnxKpTnzf1WT4ysdFpCD0n5+f2kSY57Mt3mROK3YuZJJv7GilG3f9f3qN6h2CzvvjQYnTpGHF
	4VsMgQ15Fp2GTpc51mZgGx+0E9TY3g1PySyfEhZ8ZbaC2HbcrOe4FxryvtOJN1cHjsCNfAECpzh
	xJsDN2Lu7T24Q==
X-Received: by 2002:a17:902:e751:b0:2dd:ad73:c936 with SMTP id d9443c01a7336-2df7da9e288mr44860965ad.23.1790344982378;
        Fri, 25 Sep 2026 07:03:02 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df913ff226sm11074415ad.34.2026.09.25.07.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 07:03:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 25 Sep 2026 07:03:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>
Cc: david.nystrom@est.tech, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	ricardo.neri@intel.com
Subject: Re: [PATCH 1/3] hwmon: (coretemp) Refresh the temperature on the
 first read
Message-ID: <486339f3-8516-4c88-b823-25f567c14f3c@roeck-us.net>
References: <20260924-coretemp-temp-fault-v1-0-1884f0ff97d5@linux.intel.com>
 <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260924-coretemp-temp-fault-v1-1-1884f0ff97d5@linux.intel.com>

On Thu, Sep 24, 2026 at 07:33:20PM -0700, Ricardo Neri wrote:
> show_temp() reads the status MSR only when the cached temperature is
> older than one second. Commit 5c0e64dde80f ("hwmon: (coretemp) Remove
> obsolete temp_data->valid") dropped the tdata->valid check that used to
> force the very first read, leaving that comparison as the only trigger.
> 
> A never-updated temp_data carries a zero timestamp, which does not look
> stale on 32-bit kernels: jiffies starts 300 seconds short of wrapping,
> so the comparison stays false until jiffies wraps and passes HZ. For the
> first 301 seconds of uptime temp%d_input reports the zero left by the
> allocator rather than the CPU temperature. 64-bit kernels are
> unaffected: jiffies starts at a positive value there and does not wrap.
> 
> Backdate the timestamp when the temperature data is allocated. One jiffy
> older than the caching interval is stale under either word size, and the
> first refresh overwrites it.
> 
> Fixes: 5c0e64dde80f ("hwmon: (coretemp) Remove obsolete temp_data->valid")
> Signed-off-by: Ricardo Neri <ricardo.neri-calderon@linux.intel.com>

Applied.

Thanks,
Guenter
