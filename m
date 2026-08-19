Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF1E36DA18
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 20:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787173068; cv=none; b=XUr0BM+rCNsbwGgEgH3gqym+izfv5XCYsQowxNLnVjQeuUuhe8+5W8KL1DIEjcO6kyq7rsFdpzT39FlT1hems134pEC9bGA0xfeW9fNZTndQWVfCsC19F7k+m6b+1/jSQmY7e47aJqYIW/N6tnFIc8zy1VtRynmTWVjSXupUjUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787173068; c=relaxed/simple;
	bh=gDfua+9ShagUuSPzMUyOYe1EpfBoD5A1A4oU+7lt6CA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Z2rPwmY7q0qSyTj59CmkC5nbC7f8s6C4UqzsayEUhSHftg4vtF/GB82/+GlA/bl+fqGeqVAZG2OE5SG8DQQ0ldbXjMdwkpSVXAVtZxGjPetEtOh00coJZv+TyEDk1LpWK2M/TRWVUnsSnDVZs8UZ2TYChNkjiZAwsGEx7kSfG+s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RtnWOv7O; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HFvvfx6s; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RtnWOv7O";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HFvvfx6s"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787173066;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HB6dtIzqksVtqcu2PuJ7X1T6+4gFFyG8eD+zoH9sLuc=;
	b=RtnWOv7OFN+GeseQkf5TUyRFIWSkqGJUru6FEKzxhkjWScgguIZApaYPmN96mTCmb6Ed08
	MVnXDoVCnhDbXAaanTwd+7KCX9WfgGkpF0HqQ2aRZiVHkPFA+/Yup59/uwf7VwGZa09kdp
	1LuhLsfiZeb3quHguvLuzgTgYpsYzfI=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-295-Kf_rxnq4NjqyOLbf_WiSvQ-1; Wed, 19 Aug 2026 16:57:44 -0400
X-MC-Unique: Kf_rxnq4NjqyOLbf_WiSvQ-1
X-Mimecast-MFC-AGG-ID: Kf_rxnq4NjqyOLbf_WiSvQ_1787173064
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-92e9a2b95b5so261985885a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 13:57:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787173064; x=1787777864; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HB6dtIzqksVtqcu2PuJ7X1T6+4gFFyG8eD+zoH9sLuc=;
        b=HFvvfx6snou8k8m5HGECrnxjM0MZM7kffWpmp2UeQ93j3H5a9JWu95e0uXT9eK4Mab
         O4Gw9PfnuBBrruqPraYHsxGEBFn0jpGIA5yUXG3lzxBxAGSH6mYt3rB91J4BxrlWtTo1
         4X/D+AwjjCUdBw8vnPsb8C3J6OsRGlNbxTw9em6RRvmtQGj9aZKfouRqvs9zFibDsD6D
         WgEDSX7triVURBYxjBKSSDKt7Ccj8KXQRMxYpaERAq/APIwDp//sXZhWUSxXRFX6Cg98
         1iGti2+J12xoJhfK2GWyDoyJQMceZvAbh94jJc6drHpqqbYIPPkybZLMcWfwdGGpBbmv
         rVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787173064; x=1787777864;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HB6dtIzqksVtqcu2PuJ7X1T6+4gFFyG8eD+zoH9sLuc=;
        b=ZnU+5s7SDnfyQQG2aZvNkVkjk+cWLFUVBkmzUV9OLK5N+D36hxDYaIOUn0WmdE3M9u
         EGNvWm5xCLI7kiDlsgYwdKDUHTuJBYV7m/2RmwkQd7R0Td2SVUiTIxwZWlD9xECXKqKC
         RwXCARO1D/14zA0wYyAzeqiejX+qAVL9naqTntSvTLQ81qiJN2VBocbN7WZqN93san8O
         MeHDS1cmoaarDfxZu8c6nnFREQE53TxsFp9NsIBTSauw6DxE9NXA1Bf/BJBbNJA3M4yM
         q6dHxgGjrQMQnKVac7DGhxRQAHy7DfTCLdld3DdnYHG9ueKlE/GtYSrluDmZmV66qQUb
         YgrQ==
X-Gm-Message-State: AOJu0YzZgwhhYyDLo0xL08Ls/UzxbHodp9pW8ZyYv6MOrCOoJx2WrDLU
	mhcQABq72Mn/CrzrkBrL/yx6IFlyDhtCzS/JQqgKA8MS6cgFRUFk2blLoPYEZmDiz1W++efiCzE
	WhBApzQcDhW85MdbIABMK+2gl3Zkj3pc2oWU0SF2VUNbVBO4K5nLXXsfkrkL66zabo9o2d7d3
X-Gm-Gg: AR+sD11WnVTBGDF93upbGenDW9KUjNNo8QjCQGClck7Rk37gBByjTzy171HjKVHdKGS
	WpM+Sq+7UPGlYP9B0iFDihIkYV06IHR08tSSJZA5TdY0+SLg4jRIAT7f5UXUCgVVkvh/6VPU+KV
	cRF+lXL03OM/OSMn59HS6fk6hIFW+FF9NJTt896kYXYfCwgEfC1Ra5mZ/kEAs5AeRBfuS5OkKdO
	wZ66202VtFgeAD8rtms1is5UX1QNexuJVeKbK8XBD852TaryhGUITMUNyylHsSILng6C0ipOAIG
	vcdFDn1E7MF3sobfMa6MrnGPwjwchCK+4Gvhc6WA6yRMPB+vHEmBX9YcogaLCfWpWqHde3v+81e
	H6bSSFTVdHw==
X-Received: by 2002:a05:620a:a40a:10b0:937:27fb:96f1 with SMTP id af79cd13be357-93727fb978emr207459585a.43.1787173063681;
        Wed, 19 Aug 2026 13:57:43 -0700 (PDT)
X-Received: by 2002:a05:620a:a40a:10b0:937:27fb:96f1 with SMTP id af79cd13be357-93727fb978emr207455685a.43.1787173063250;
        Wed, 19 Aug 2026 13:57:43 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93720584d5dsm218840785a.36.2026.08.19.13.57.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:57:42 -0700 (PDT)
Date: Wed, 19 Aug 2026 13:57:40 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 2/4] hwmon: (ina2xx) Replace masks with enum in alert
 functions
Message-ID: <aoYYxM63yFRgrxFD@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-2-349f7b2f1df8@redhat.com>
 <20260729160250.7FCE21F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729160250.7FCE21F00A3A@smtp.kernel.org>

On Wed, Jul 29, 2026 at 04:02:50PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential issue(s) to consider:
> 
> [snip]
> 
> [Severity: Medium]
> Does this actually distinguish current from shunt voltage alerts as stated
> in the commit message?

No, this patch is intended to do some replumbing to make the fix
cleaner. I could see how the patch phrasing could come off the wrong way
though. I'll reword this in v2.

> 
> By converting the enum back to the shared hardware mask here and in
> ina226_alert_read(), and not tracking which alert was actually configured,
> reading current limits or alarms via sysfs can return the value or status of
> a configured shunt voltage limit (or vice versa), yielding incorrectly scaled
> hardware measurements.
> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but does ina226_alert_limit_write() reject
> valid configurations for reverse current flow?
> 
> The function explicitly returns -EINVAL for negative limits:
> 
>     if (val < 0)
>         return -EINVAL;
> 
> This prevents configuring hardware alerts for reverse current or negative
> shunt voltage, such as during battery discharge.
> 

Shunt/bus voltages are clamped to non-negative values in the driver, so
this seems like more of a design choice than a high-severity issue.

> Additionally, if the limit is exactly zero, the alert is not enabled here,
> which makes it impossible to trigger an alert at exactly zero.

Disabling on zero is an explicit driver choice, per
Documentation/hwmon/ina2xx.rst:

    Writing 0 to any `*crit` setting clears all `*crit` settings and
    alarms.

> 
> [snip]
> 
> [Severity: High]
> This is a pre-existing issue, but can the calculations in ina2xx_get_value()
> and ina226_alert_to_reg() overflow?
> 
> For large limit values, such as a 200V bus voltage limit, the shift operation
> in ina226_alert_to_reg() on 32-bit architectures:
> 
>     val = (val * 1000) << data->config->bus_voltage_shift;
> 
> yields 3.2 billion, which overflows a signed 32-bit long variable. This
> results in a negative value that gets clamped to 0.
> 
> Similarly, in ina2xx_get_value() called above:
> 
>     val = regval * data->power_lsb_uW;
> 
> the power calculation can overflow a 32-bit signed int for large regval and
> high power_lsb_uW, returning negative power readings.

This is addressed in e6c80061ca23 ("hwmon: (ina2xx) Fix various overflow
issues").

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=2

