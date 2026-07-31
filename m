Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAD1231691A
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 14:30:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785508241; cv=none; b=L5vRKSxAJPhmi1r+71zOLjMABd6mRw08cyjAZ+sDuVprWGauN2iiTcQg1Qff3QP/ik+tq30UI+Is/PNyh6cOitN1WPycLgFhvX8ngxBnIRPp87B3jtJ13rUn7bbOuFgZZzC4VYNOpHC4eB+N7lvJpuuE5DapEkfMDnail2IiH08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785508241; c=relaxed/simple;
	bh=J7sJTmnpOhAjW5+zjnbcf9hhUrEm8gW30f2DU19dobQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tU9XKuV0H5qw3p6/urQ3YBJL0b9HpwkI80Q6o1YIzXpmxAs9jHzbb7+MFfbrkhhI/tydjzQUqHnH0YiMyhmA5qFoo6MpEh08yEkmUgJBYWPz9vccEmFIW4+VN1mdD21twGTli9knylkny4ECXVo2EvKsXscb5w7wbn5qSNa9ENY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aTzNcop1; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aTzNcop1"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cacf197759so14049905ad.2
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Jul 2026 07:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785508239; x=1786113039; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=FTlrxf1I8LzpSgS6DKVSVnJ8fEe1nFEXSdlDqlnNbBI=;
        b=aTzNcop1pocIoFeIP91VgcIgQWnmxlHYwBlx0dkrdFFAmRolqGEx09PEWgjU76xEY5
         DL209V9ftn94Pf5JbP10mYzzoyvY267UC6qsyWwSxRwpNx0dXPF4zavT5YNGtVaWhVzJ
         nvWtVitu5YB92ezTeY5DrA3XYRuSEED6Tnjb0mafPU9xeVMFYU/0vH4CsC2sFLlze92L
         i8evjC4ovObkFaR3XXxX52RAtnV4Gkwb3K8cbxPD0UUDRfVjMKxt8dy5ssD5e0bC/Kjv
         +Y4CbgU8KWewpdj4LlFyRwncmtn3mDJFNMGYrWmqbrMYUXGzr7IV0fni5QZBxD4KNUBV
         Sx3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785508239; x=1786113039;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FTlrxf1I8LzpSgS6DKVSVnJ8fEe1nFEXSdlDqlnNbBI=;
        b=iEXXC9SXEBnHR2mPFKkplUEGp0OgPpd35Ihja33gsxXfF3oSTJzocIwmTGpA+dRdxF
         K53SK+OzCXXsRG++QOOo9HEWfzb6V23+7Qa5QvOKJzqsDGfr35HtCnpBxDXRBMS2ef36
         wA+hP0PGvfy4lVPAxnh8cLZd6llX35sx2eKBfe/WZmjQxUcx34k76HGtZAtgZyB4Kstb
         4D25ZbmTjB8H4Y/wzbQPiIz9nAmqozXoIctovxjlA3xarlVLcRcDY8VogAzR+eodbjJO
         cE1vEWOOt7LgqiS5cG51CVolXmSgQvb0eVo5FMMkc1GOGIXUMgIp1o2p3aYFxmdseTPm
         EAlg==
X-Forwarded-Encrypted: i=1; AHgh+RqxLHNvW2I9HHEGhtrEPCGrWNaxjAZQotWAW2RE77ci3IwfzW2yAfzTP5ZMTbiiDc1IogsMxCv6+t1vaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyNDlIUl+MIfOEgFvXAdsqwcdiWgmrj7cbRQto/3ATOGFf2cq4H
	RN1Ib6VtNK9jGIWZ38G8pxBMEsfGnpG0SWKLAEaMzr040hJJUAdLKq/Q
X-Gm-Gg: AR+sD12SWQR1TZGdO519cZlvF2Fa1zriywBUYcCSgFH5lM8ST4e0sesjd8eV8X+1YwH
	638yNc1kkWivmpkApLbIZY9Sq4trNxXcAHf8Gi+ptED6/99NXMo5J64OHoqyDcPgP4tKwvFt1mZ
	D1K0hc0QL79EO7SruUicV++iqjpWlrkXzBc3UkEnAhn3ZN74Env8gTk0sGsl0D6tPzRmXlPr8vq
	E/rTNy5ZmO6deAW9xZ0bp7GLWuTYKXfdr16XBA0gEyug7IvEaKDYDyXhQYRVxAHvAru0zEa5chc
	wPQNUSGrgncZCe2PSO5O4WVFz2DpAfBNOceXwJMDf70KWrGn2DdGa/EowUc3QnBtH8wvuqMQnwd
	GGsf/8fq6sb80v2az+EByF383l4kkWo2Du/DJi/Tk9/I8AJDQvazNLXqsAEs8vpD5R/V3wwK168
	g0iYDDPnDffvH2r+8GtIOxiIlqoANhBizJCVU7kOZatbLzrptoHA99S0cuqGfAjJB0RQMfUhh2E
	IiIFFWft2Jp
X-Received: by 2002:a17:90b:1c86:b0:38d:ef48:b04 with SMTP id 98e67ed59e1d1-38fbc4249efmr166575a91.10.1785508237619;
        Fri, 31 Jul 2026 07:30:37 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38fb2964c10sm782178a91.4.2026.07.31.07.30.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 07:30:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 31 Jul 2026 07:30:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Charles Hsu <ythsu0511@gmail.com>,
	Markus Elfring <Markus.Elfring@web.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 3/4] hwmon: pmbus: add MPQ8646 driver
Message-ID: <2529176c-660d-4d00-93b1-77d0d864cf8f@roeck-us.net>
References: <20260730-mpq8646_v0-v7-0-e7c7ad768d5d@free.fr>
 <20260730-mpq8646_v0-v7-3-e7c7ad768d5d@free.fr>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-mpq8646_v0-v7-3-e7c7ad768d5d@free.fr>

On Thu, Jul 30, 2026 at 05:44:01PM +0200, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> Add a new driver for the MPS MPQ8646 that is a PMBus device.
> 
> Beyond basic PMBus telemetry, the driver adds:
>   - alarm acknowledge via inX_reset_history.
>   - STATUS_WORD MPS-extended bit decode and the NVM-backed
>     PROTECTION_LAST post-mortem, exposed as a read-only debugfs
>     decoder.
>   - In-driver alarm-poll fallback work item (thanks lm90) for
>     boards without SMBALERT
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
