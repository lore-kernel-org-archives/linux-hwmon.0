Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DDA82DF12F
	for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 20:43:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787172184; cv=none; b=AzEWRBKsG/pTAqkrJnImcff/GAGcgBSQBNfcS6E993IJ5k7XYwZ+xffMp7rB7OG0+lCpihPeqdnvTOHq81L1dPSPBnO+hqqBp27QBhsCypf9qu7SKD0++jHol1HCQHwCCHmGwvnFsurR/hB1BHtWghEIpoqbbyXH5bVBq+f0Tg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787172184; c=relaxed/simple;
	bh=lsmXjePorRAzUjJL6ORGR+bUFBHa1eeaFQXiJVML7fk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M75i8aoI+w5Ida+uNIkRaI+/z9RYVrvVkSzB428cPX5ojXKsG4i7JSwynIEuiXw8XNRXSA449AFXk5vTKK/cwDKYcWCTSXUedNKVhiz0rTh7gfav80Vbhtblhl78jVW1f4YUVuii/L/VAABTTRCieCawCZQni0YTAa2xx5U0ImM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TvNIf6ho; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=H2HijPKC; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TvNIf6ho";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="H2HijPKC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1787172182;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HhcnPKvnBcdmIG5Q5TzyCZUomoVpouA/md8ztmVdXeM=;
	b=TvNIf6ho/3ILZZ96r+MOqrV8xYNxvSQmo5OmVZbTl0JP3seSRF3/al2DBp9O4aaJakyiy4
	ToqKhIlE0GPcHUOCM7mevaMLilAGBnphKiUNaAwaNUwOscCppEmWCSbdTpxZYygTmz2kl6
	4K23x4StBXEWmv1xSSmPXcnBzSdRW4U=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-659-TSjouoSMOuWimqOffJKFRA-1; Wed, 19 Aug 2026 16:42:55 -0400
X-MC-Unique: TSjouoSMOuWimqOffJKFRA-1
X-Mimecast-MFC-AGG-ID: TSjouoSMOuWimqOffJKFRA_1787172175
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-90a91f4c6f1so11247056d6.3
        for <linux-hwmon@vger.kernel.org>; Wed, 19 Aug 2026 13:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1787172175; x=1787776975; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=HhcnPKvnBcdmIG5Q5TzyCZUomoVpouA/md8ztmVdXeM=;
        b=H2HijPKCxznkuk+UOCT6ypMDN9GEhwnkFh1DITuo77/aWsuSkb/F93+zkcB1c0AdmO
         yU9sT4m9HuGSkqf1nUoSk+zS1kd1JLOOQJIaUMEIINWk6xcWI8gMep3hFBwm+ST/T3n9
         ByVa8Lu6ll1FXf1Eh/HeUNfCZV6HOXeXdHdonYg3k6MYSMbI5s+Sbkd0fjfBfQJtU6J5
         uaMNZUWVZ2WonDOu7/Iwc5f7egnnPboxvPTG5rHny8WGT2BVI9cQbMXJMeyUd0jCutl0
         ulu606crKehwfo0ynSS8UQb26bAL6umIrtWDrKRuUPv6hnRBd18Wh4dmwSuHECS4BAiw
         mTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787172175; x=1787776975;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=HhcnPKvnBcdmIG5Q5TzyCZUomoVpouA/md8ztmVdXeM=;
        b=SZgiSoI2C0FGoHod++VZqMkIC22vb9PvAd84Zkl09bRy8MDYuLlIZKKeeFraGgbIIy
         htXPX4AWPGmHPfveGzoDv1rixHRJKhgSLId3HTnUNF7N29MMwFYhkA8vEhk6+PSbBvk9
         JbmU0eY1+QtOXf47xRX7RQ4ywhNmFJffXhel+qkDLooRnYilZ7uyyFGU67uc1Vh0YmK0
         slMfIEHqlsY226W7Q0A4HvFUDQjCD2TbmGbwfukIouwDD6PLst8QLLX3rvYJkMJcnmVE
         BRxBsDm+4sKbR9f2+jvWME3TXWusotFiPJDLIVYff4jH0U/rg7jAprA60BA6RA+Op3uq
         xQcA==
X-Gm-Message-State: AFuF++mvsSfIRelmoRy6/jfBLoYMEesyFs9QALK6qI8Q7K1yhzATjtme
	L+iEkT+wVY5/M7ANtxe9e4e6h+4Glt/Lz/ozFcWb+gi9AkV3OzmhtV/WNH4Qxml5cXt9V5/CQG4
	r2pYLnC/Fb27iQNPDH+Fa46/IkZAdb+4hedyEAFyVYMTgmlgl1UZrNZ68PmtYg5aZ3mto9VR4
X-Gm-Gg: AR+sD13kry/nJIuR91s/Et4sEQCN0E8vU8M22dTG/VViDEev5N8ppOf+tbhapeMXRxf
	WCsvwKADczQ71ag5mQE7cqLSk9smmd8s6iTe7SME7jevt1numVFLT4LLyNJZwie9vODLKzKyT/E
	KW64exP4HrI+qUzW2ID5QpHCGVyvy6I9R2YXCacmkaG1Oj2Yx90hCvSDJOjyxOZJJX7nnoMTorX
	MP+AX3C5RAnsg6xMgAj2RVi5le0t5eCa34oWOuHyC9tjS27k3RLUvrU+eo3b5GCg/s0AhQz4eBO
	sfhtlAQMn6RhNebwhKKrHPMhRG5kPtbjcAlTHEDK8kBjov5+dNZTJv7uj+mMjVq0UNxQ0rgCL+I
	Tcn+MRkhVgQ==
X-Received: by 2002:a05:6214:2122:b0:90a:807d:31bf with SMTP id 6a1803df08f44-90c5eab90ffmr71349316d6.24.1787172175302;
        Wed, 19 Aug 2026 13:42:55 -0700 (PDT)
X-Received: by 2002:a05:6214:2122:b0:90a:807d:31bf with SMTP id 6a1803df08f44-90c5eab90ffmr71348866d6.24.1787172174902;
        Wed, 19 Aug 2026 13:42:54 -0700 (PDT)
Received: from rh-jkangas-kernel ([2601:1c2:4480:2110:932e:45ef:6b6c:ddd0])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-90c5edb4fa2sm22921116d6.10.2026.08.19.13.42.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 13:42:54 -0700 (PDT)
Date: Wed, 19 Aug 2026 13:42:51 -0700
From: Jared Kangas <jkangas@redhat.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/4] hwmon: (ina2xx) Replace regmap in
 ina226_alert_read() with ina2xx_data
Message-ID: <aoYVS8htMnz8vLQb@rh-jkangas-kernel>
References: <20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com>
 <20260729-upstream-ina2xx-in0-curr1-alarms-v1-1-349f7b2f1df8@redhat.com>
 <20260729155254.2C9261F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260729155254.2C9261F000E9@smtp.kernel.org>

On Wed, Jul 29, 2026 at 03:52:53PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> 
> [snip]
> 
> > -static int ina226_alert_read(struct regmap *regmap, u32 mask, long *val)
> > +static int ina226_alert_read(struct ina2xx_data *data, u32 mask, long *val)
> >  {
> >  	unsigned int regval;
> >  	int ret;
> >  
> > -	ret = regmap_read_bypassed(regmap, INA226_MASK_ENABLE, &regval);
> > +	ret = regmap_read_bypassed(data->regmap, INA226_MASK_ENABLE, &regval);
> 
> [Severity: High]
> This is a pre-existing issue, but I have a question about how the hardware
> alert state is managed here in ina226_alert_read().
> 
> Since the INA226_MASK_ENABLE register clears the Alert Function Flag when
> read, does this bypassed hardware read clear the alert flag unintentionally
> if an inactive alarm attribute is polled?
> 
> For example, if userspace utilities sequentially read sysfs alarm attributes,
> could checking an inactive alarm trigger this clear-on-read behavior before
> the actually active alarm is polled? It seems this sequence would cause the
> active alarm to falsely report as inactive (0).
> 
> >  	if (ret)
> >  		return ret;

Yes, the current behavior of the driver is to clear alerts even when an
inactive alarm is polled. This is addressed in patch 4/4.

> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20260729-upstream-ina2xx-in0-curr1-alarms-v1-0-349f7b2f1df8@redhat.com?part=1

