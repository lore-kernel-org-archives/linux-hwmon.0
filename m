Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2B6B330651
	for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 16:38:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781195892; cv=none; b=o7yD69uT6QvYRxorLAOHjbY788nMUslPVk6RkSJh+XkeuqUFzPwk61Q1s/m8jgMRDPfBftN5cgKxVeRkzNcNWyUpYh4VMHX1LVW8QBPLw7RzlD74dI2YDmBiStLff3d2SjUAs6TmMsZZPf6fZOn9oWCf+V/wAhrzPQJsM3Yf79c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781195892; c=relaxed/simple;
	bh=eijCJIWCzE7dOaaMhC6ytwZ56c0ngQs/vO7TF7uckw4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ue3uaEHhk73mEH1Xd+hpLTOs7FvZKmxpC1RqrLnioRniKgBrFRkP8kTkJm6ZhihHg3BLXUZA1znamzH40gdP0p2adR8CAeSdn8tAtojMhYiHM3/oiIRXO2AaSWyw+7E5xMQWxiEJC6M32Iz2jdMic3XpxRyhDaU2E3o4m7v+Ow0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4WJaeE6; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4WJaeE6"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-490afc47455so43913655e9.2
        for <linux-hwmon@vger.kernel.org>; Thu, 11 Jun 2026 09:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781195889; x=1781800689; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/slxkBaga7WdFYUIk+bpf71i1yduik1uqRPXNyL7qIk=;
        b=b4WJaeE6pdENyvdjptJtoSyd6Lmr08PZTlPH8VYoRNetEVFqxAUuviMFCJHXdNjUJF
         4JbtiVnkdAumsYLd5RjqE0ekopAvlYvzaJARHjuJB1TNk9NMFO0AzJP0e4syIvYE35Pv
         yCarcKe9bqDLhJQ7wnbCYBg2anRxJcxg0UxCfBEFrgKIKMVnYiESguzniNEykK1MprOB
         VVtHoqqD+A5KRlt71ynUCQFPqUWWXKHKvHJ04F+NAqa/BOJhLyKuRuLjFdIu7gtzWOjH
         DSqGcoV+VyPUKyoR/1asmxBW68Fm69chXCNDdovENvF27//1R0BqW4+l4x/a0xIIIUDd
         Td6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781195889; x=1781800689;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/slxkBaga7WdFYUIk+bpf71i1yduik1uqRPXNyL7qIk=;
        b=jG/Tj45vPKsY0oIw9rEt20M8FXg2NXccyDo21TSeyRzO0Z2N67ZalC/2Ja9tvV/egR
         6iC4O19haRT3TVvwIQi/wD+r4yhz67XRiuZAjdq4K/DbjLJYAmjFzaOfd7a+m8MEms8G
         NLdY/5L49VcOAIJl2Jbw05MOOT+v8oljCFkj+izY9Qf6BFu/SN3k9TxdxUXyEV84dJo/
         nJ8bQBRJLTt6vWsm6R7LOLyulpLLymEG5eWSs3HT86s1FuRpNwWNX0ObE9SWdn3Ga+8P
         kI0CbQ2ZSs7zTlPzHL+zcquCp6IzJMw/UE0cN0jWNQ7T4aMunYN6dcomBxUx4KIpPO1L
         ZTfQ==
X-Forwarded-Encrypted: i=1; AFNElJ+PBahfBtCq+2HfqX0phfBewcsl+On9U1qMvuIsIToL6cNITCQZmyZLkH0rnd16yqYCwCjBG+x2b2e0Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0ScUdyRtchfq6U/hDHaOjYf+lDke5Zb/sxPAAZOi0MhsVW2ka
	Yr6Fms8hd0WwEsqzqpaNM/PwHmvLXsXDHy5x8/uhzhOnwO1mAsX44JO/
X-Gm-Gg: Acq92OHZarmHx6Vo72kDOfGHyzpMEA4ARxG0OvCU8SZC/Z+3KV6ErZhXd9nvm505MV+
	zqjJfednVRTG2JlcnuYsIt5bR0txMQrQt/Of3LdV+wDXuM5l+pPGVLHBG/4pdeWJV8XvhdWeORt
	mvYcxk5CaBskDOgUMrPMYsdrpWpvUeMRNTJjnWzfspIbTOLrUJsW0hthOuo16QwZ84S8Pms5m4/
	kyLrU9h2oN8sJa4VAgG1oboFsNMvRbFcpXsI4vOnDo1hS6DqbsKinthhG2B7TFFJIpsINl3PsmG
	DFivDGWw0qE3nyDEM9GT7L/9gVJNe+cEr9XIphiFnFseqeIKvbT+lyaHUyJYYRl6o7iW1pfJgUT
	R9XZhfGB8IjNMYXJoKXq8iiPAs5IqsZycZarBsd3xXQRz8ebVhiKz4R5uFGAyAZ807K7hYtBQcI
	WEtypwjg==
X-Received: by 2002:a05:600c:8b51:b0:490:e5c1:b8b9 with SMTP id 5b1f17b1804b1-490e5d0ff6dmr48188685e9.0.1781195889065;
        Thu, 11 Jun 2026 09:38:09 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490ea4a4db2sm266015e9.1.2026.06.11.09.38.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 09:38:08 -0700 (PDT)
Date: Thu, 11 Jun 2026 18:38:06 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Sathya Prakash <sathya.prakash@broadcom.com>,
	Sreekanth Reddy <sreekanth.reddy@broadcom.com>,
	Suganath Prabu Subramani <suganath-prabu.subramani@broadcom.com>,
	Ranjan Kumar <ranjan.kumar@broadcom.com>,
	"James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Guenter Roeck <linux@roeck-us.net>,
	MPT-FusionLinux.pdl@broadcom.com, linux-scsi@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 RESEND 1/2] scsi: mpt3sas: add IO Unit Page 7 config
 accessor
Message-ID: <airkbg8-kDC0Gyv9@localhost>
References: <20260609164423.2829699-1-sautier.louis@gmail.com>
 <20260609164423.2829699-2-sautier.louis@gmail.com>
 <5effba66-0d42-4d42-9833-f2c0be6874ad@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5effba66-0d42-4d42-9833-f2c0be6874ad@kernel.org>

On Wed, 10 Jun 2026 08:12:05 +0800, Damien Le Moal wrote:
> > +int
> > +mpt3sas_config_get_iounit_pg7(struct MPT3SAS_ADAPTER *ioc,
> 
> Please do not break the line after "int"

Hi and thanks for the review.

Sure, I can change this. Can you confirm we want to diverge from the
convention used by neighbouring functions such as
mpt3sas_config_get_iounit_pg8?

> > +	Mpi2ConfigReply_t *mpi_reply, Mpi2IOUnitPage7_t *config_page)
> > +{
> > +	Mpi2ConfigRequest_t mpi_request;
> > +	int r;
> > +
> > +	memset(&mpi_request, 0, sizeof(Mpi2ConfigRequest_t));
> > +	mpi_request.Function = MPI2_FUNCTION_CONFIG;
> > +	mpi_request.Action = MPI2_CONFIG_ACTION_PAGE_HEADER;
> > +	mpi_request.Header.PageType = MPI2_CONFIG_PAGETYPE_IO_UNIT;
> > +	mpi_request.Header.PageNumber = 7;
> > +	mpi_request.Header.PageVersion = MPI2_IOUNITPAGE7_PAGEVERSION;
> > +	ioc->build_zero_len_sge_mpi(ioc, &mpi_request.PageBufferSGE);
> > +	r = _config_request(ioc, &mpi_request, mpi_reply,
> > +	    MPT3_CONFIG_PAGE_DEFAULT_TIMEOUT, NULL, 0);
> 
> 	r = _config_request(ioc, &mpi_request, mpi_reply,
> 			    MPT3_CONFIG_PAGE_DEFAULT_TIMEOUT, NULL, 0);
> 
> is a lot nicer to read.

Do I also align the signature like so in both the source file and the
header?

int mpt3sas_config_get_iounit_pg7(struct MPT3SAS_ADAPTER *ioc,
				  Mpi2ConfigReply_t *mpi_reply,
				  Mpi2IOUnitPage7_t *config_page)
