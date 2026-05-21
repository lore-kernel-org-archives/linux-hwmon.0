Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1588611E
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 13:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371163; cv=none; b=kVzOI4CqwiLaVRQJsQDJjgUJpZQJEfq9/hJXhl5GFxCw/m15jHWH9IoRw1dq9khLbQ7wUpzUJN4g2/Bue6cHbtr1qp6nA8Tps/SNJsfHJuPhHJqGa1guZnHt518uO/DfzxVJZyc9QmpXnag+NGHzadT4FG1n8Bhx5Oms1Z5HeUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371163; c=relaxed/simple;
	bh=fwrXDyVaz2vFk8whiNZbjAk8uDTFuOSI9Qe0VnvaFAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fHuYamE2gerCCi7392hxvi5tktENM9oUy4GoM1QGvNCkKgr8LHtypbCA2xu3IE70ZChn/aiuNRS8D6TA0jWgz+njYC9OEavnq4kJGb8wLdch/6IxiKqb1tW7YeeelbR5swE7hZjSID+y7+xXR5k64uDqkqJdVTKhjtGD02p45x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oztxlp+X; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oztxlp+X"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2bab82d75fdso30156245ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 06:46:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779371161; x=1779975961; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qMfJJmpBQ+WQiwiLW9XDeAzh5VEAeS2cIS33bhI8vz4=;
        b=Oztxlp+XdOP5w4S4RI2oTfQBBTNcxJl3daO+4zljAq9O1r5RhydMKuTPZeG3LVd2YD
         oWWtJXLTe3ANc6yjGHdf2T01DuPpZnDXDfSFUa44CSRk9vRNfctKrIVkapcZnq8Ei/Kt
         mgJWUZxV/ZB++hTROIc+EidDdj5UBXLsiw+0uuLUHizMvQUy0oeRPLztWp1mis43MsP/
         bXRPmff7h9n4a9tC3p6X3QomuR88JbrWByxH80gIOcCsCKDKuc9wRHMkFi3qtBSdBdhc
         eWpR4EzYY9DtzDF1E0SlFdMmS1+Y36h1L0UcC631zlMEJdoTwki7IZFhd58gNC0D1bCn
         NDdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779371161; x=1779975961;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qMfJJmpBQ+WQiwiLW9XDeAzh5VEAeS2cIS33bhI8vz4=;
        b=hPGylJCU5il/MpU6cEi6XG3vRKjJ1qqz6GgrfeO44IufjyZaiU6pDdMA3A3g3oDnGx
         znYmfNxnSbhCPktbrmg5kNWIM8gt3w8kGIMJvYv5lj2CwV+SZRL6OCoTsjQJC7uxibDw
         X76quJQ3MNWciSnqlwYFQVjyNjkgh9lqVN9sQmNUkXpTDBv8K3mCzelQ05EBYAlDD9po
         Z+E6swTzB0FTUmXQ3dCxAdTYp4qqqnJ8Utb1lzsibP/fS/yF3ivrOQJgEwljNpgiDpO1
         jSEN1ORel3OiJalospgf3sAEF5ocgfBFOazB7CiRIRnXPGNb4g3Ka8WGS67O/0B1ZyLk
         nRfg==
X-Forwarded-Encrypted: i=1; AFNElJ8AR7hcBKlwn0XXi9iVYG64S39cJewrdfjw2yfeDZvRPDYg2M8Iq8rk/9jHmn6b/nAUR/spqy2uplBCKw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBV6Dejym2e/CpoqIQ6yRD6BQmWoYYAWYMGLJkqJQMTJI3h9aD
	mzsgAluMb0LR/pDSMpAOcV1Ool9E+mbZ0Pq7LtpuTZDYt43WOeoFJw9/
X-Gm-Gg: Acq92OFYWJodjUc0bUZ1RqWxrzPL/34QasW5GZV1iVJ+uVFO/f0z1LFrP+FAdvraH1R
	0Mvo2Z3Yj2SYER1EnjD6vz/Pmos0UfYRaGVkn/f3kFcWqWgTCc3P6zC6VqqSoIIKbygRusliQF6
	bOnkJDQif6XLL0A9B72o/eeOIRu2RZBGVzLdoXsuPPl2+8Ys82PcdgRdRGbEmeDZyJihEbhiegq
	hcqY+S+e3/8qptZDFLe3cYqDk97X+sC8U9Vl1Jpns8lhidTMkOkTscn5XBiGBer73AFhtxZ0Mrt
	FNjHeBVXQHXV6i+czS5H+wzFTpSRb5KYPOeUZCGk9JohITahPHKB+quDHv5MNMTlD4f5j1Yfvbl
	K2ROxOqTGZGMTfaN6rYyv3gHEaZnbNzMj2Pt1C1+Z14bmVWMUDL+87ZpZhDDmcInAc24oZUCndX
	8FewO875DHY851HlZlV9/phcvxbC4lUTnXpQiq
X-Received: by 2002:a17:902:fc4f:b0:2bd:5026:ca11 with SMTP id d9443c01a7336-2bea30910cfmr35741965ad.2.1779371161153;
        Thu, 21 May 2026 06:46:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bea9282b63sm13015465ad.22.2026.05.21.06.46.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:46:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 May 2026 06:46:00 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kean Ren <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/2] hwmon: (lenovo-ec-sensors): Fix EC "MCHP"
 signature validation logic
Message-ID: <f12705e0-2e91-49db-aead-d29d92141511@roeck-us.net>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260521035228.533317-1-rh_king@163.com>
 <20260521035228.533317-3-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521035228.533317-3-rh_king@163.com>

On Thu, May 21, 2026 at 11:52:28AM +0800, Kean Ren wrote:
> The EC signature check uses && instead of || between the four
> byte comparisons.  With &&, the condition is true only when ALL
> four bytes fail to match simultaneously, meaning the driver
> accepts a device as a valid Microchip EC if ANY single byte of
> the 4-byte "MCHP" signature happens to match.
> 
> Due to short-circuit evaluation, if the first byte reads back as
> 'M' (0x4D, a very common register value), the remaining three
> comparisons are skipped entirely and the device is accepted.
> 
> Change && to || so the check rejects devices that do not fully
> match the expected EC signature, as originally intended.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Kean Ren <rh_king@163.com>

Applied.

Thanks,
Guenter
