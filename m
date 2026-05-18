Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69E30384245
	for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 19:46:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779133593; cv=none; b=tMYu9FuifTkNVYBgzJ8vf7Zc6VJSM4inZTrggQZJwFxv2+gNWxe8Hz1gVrTPJ3oEyPC2wbu+ZuRepo6/+NTyDO/7aqOz1DVWxxWXPlwbHe7uG4x7UNLN/LEy6ls3IWjD4zPkkBvl4xaZVejAm0RV3XByccEtg5/PPtLi+KEqLQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779133593; c=relaxed/simple;
	bh=VdwNJ8/RRSGa6smjQtGivvMghdJohUW6vOp7PH82XIc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TpkQucABhBm/9ZLRv7t3ih73jpA+dbyToRtFy+8m3TZ+uzz1UDOvfIAJeG+UGaYUFDFWLBQ7Ano03iVanqmCDt13J+EjzQOQ4YV4UT+x+h8hDKgUyptkFrpXtedEWPAlH0Nw3miC5kNJIdXLkCjFALHpYzRHGVAC2/Ao/bH81sQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bU+9NIHe; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bU+9NIHe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-488af96f6b2so30075455e9.0
        for <linux-hwmon@vger.kernel.org>; Mon, 18 May 2026 12:46:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779133590; x=1779738390; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=12EE8Opxoylr62oq1gP9QJGH+sUKwH6pdG1cIQyJcXw=;
        b=bU+9NIHe9jVP24n92j73iivgtMwhNWx5Rrshhd0hHRA+KhlPppo9nCt/HzI9YWoT/N
         L2djgc5HFMGFCDg/ybXAIUC//65ZXqrAzbtyB7dYo+K6C/JKrrULRctUSI+LPHdQcYAL
         R6uBgcBZgncn0Cn8aFwlzKytdR6eHXDaZelrwbTVTwMAjHzypj1hu61j6JDCwCn+7IWF
         Xz4xyUD4PvCcQ3+rU6pk3OPUZD8N4fgk/8KOmByMAP5vAgTk+mYwiBgDQsmjM0TghVjM
         qc6rZvSp4GoYud/pTcEtslz54kW/tFilCOK18/xkbPBXY2u4i8/4p2UbNrJlli32iFll
         fRNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779133590; x=1779738390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=12EE8Opxoylr62oq1gP9QJGH+sUKwH6pdG1cIQyJcXw=;
        b=Jt4Hk46cOmK9NWSu6+k1VxKD+FqkMb/K/GojA9eGYLvl5bW6QU9hSBse8iarHcTz3E
         toQof31gwxSI+Cf+VyPqodRWfJrGn2/SbTndT5hh5gPcRVEAu+/rD1owEsjYkIokNZhd
         xq442iN9/nyDyr+rFrCUY2/KMAOIbRShcC4nHBIUFky+D3ULB+IRvr/4z3ko5/tJfjZV
         CVRX6NvJ9EDO+/oWF4tPDZdF53Qd1w50WJJZPoHQBROASVIJOgfyZ2a2K15ZKcm9z/kS
         u/12AkVe/1kLCzBfwQtx8JS0WoF8oOV/MrZUMGAEuPxT+N5kiD60ZsAcyfyEvAK8jMHx
         qMCw==
X-Gm-Message-State: AOJu0Yxfc0BvueQ3MCJgHrYq74Soxpvl+xRlQVG9eoQTMN1mgMm3T44a
	hU6Q/xVrF/t1z3Ax0fSOKIWfv6aUXfwWsOdcN0ve6YHvTKg/AEwN9fw1
X-Gm-Gg: Acq92OEyIMrJ59UyfeNYWf+KV5bdHnN2LVI2naWo9XgAQUc5SCJocJBk2Ec15TBPH3J
	yWQKqGH0GC75YJqDcxUG8ktclC/eQkTmbYp5uJnfW+TFh0MMS7of4X4cgrQ9f3X/7+rPY+UP1Rt
	T4J7G/veRNCadWgNTLPqH+4i96Vcf+1hgiNt6DqPrGkeGvHU/oezx1NESJ17zUlVgdBCqPN80oT
	GByPoS5uSzsIOO/XLY5sEA6nk7D/3jzkAiDcZBqAxqVn5wNs3XtNDkRYzjN5CtedGcdIHdWOaKq
	Mp+lLYQvaCZN2uV/H72YiJsGjN5RS+HnBBTMvciLIqs3KpDwq6vIMR02ISIPezebZ6HGywxYKK+
	gVRe25yR2U82ZppZ7+D1VwxOZ8ajowvJhELjGAJft4VlA1hAc3DieBAlv04QAzlzQUiWllp0CqZ
	GBRph2h5c=
X-Received: by 2002:a05:600c:4504:b0:48f:d1b8:9a9c with SMTP id 5b1f17b1804b1-48fe60e14bamr246537865e9.7.1779133589646;
        Mon, 18 May 2026 12:46:29 -0700 (PDT)
Received: from localhost ([2603:c027:c000:3cde::f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48ff43f8799sm165921765e9.2.2026.05.18.12.46.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:46:29 -0700 (PDT)
Date: Mon, 18 May 2026 21:46:27 +0200
From: Louis Sautier <sautier.louis@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] scsi: mpt3sas: add hwmon support
Message-ID: <agtsk8mSxPaIz_tX@localhost>
References: <20260518184109.770185-3-sautier.louis@gmail.com>
 <20260518193758.889DCC2BCB7@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260518193758.889DCC2BCB7@smtp.kernel.org>

On Mon, 18 May 2026 19:37:57 +0000, sashiko-bot@kernel.org wrote:
> > +config SCSI_MPT3SAS_HWMON
> > +	bool "LSI MPT Fusion SAS hwmon support"
> > +	depends on SCSI_MPT3SAS && HWMON
> > +	depends on !(SCSI_MPT3SAS=y && HWMON=m)
> > +	help
> > +	Say Y here to expose the IOC and board temperature sensors of
> > +	LSI / Broadcom SAS HBAs (such as the 9300, 9400, and 9500 series)
> > +	through hwmon. See Documentation/hwmon/mpt3sas.rst for details.
> 
> This isn't a bug, but the help text references a documentation file that
> doesn't seem to be included in this patch. Is Documentation/hwmon/mpt3sas.rst
> missing from this commit, or was this added in a separate patch series?

I forgot to remove this sentence after dropping the documentation. I
will do it in v3.
