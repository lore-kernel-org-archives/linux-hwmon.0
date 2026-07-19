Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35FE639A05C
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:19:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470792; cv=none; b=i6bBTRoi/X++gCSxfPwYXt5+NGQ2X6s58uU0M8XxGkbJ+n3DB7kuTkcono9bHpG04+D1qt6M7GEE5f8vCNHfCYOe6heK2TtIDlIxH8Pm6Un8OWRKvt+ut7om87bsKnytNtMBYTJNAchIZw+ItTD9KnupBrqsmaSJBA1SqCRcd30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470792; c=relaxed/simple;
	bh=o5tb0Zi3Cm40QhYxlnewunNMKsrVgEnw6MmQn7jE4Z8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKRWZaU0TaPRAJmLZGtx3GUYIW1j0XBk16DQhdbLoId4uoJA2HCTU+6EdCM7aIoF2sOIEln3R+R6mLi4upvA9tc2BLigCMaCKrh5IRrA06QusL3LoE9h/pS9QQTtH54lJhk/Lzl1QAkOWwtdH7WVrmqj3dI/XOtuhSuacJAtLhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EsHmOkpM; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EsHmOkpM"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so3787783a12.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470785; x=1785075585; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aXFV6i8m5jYb+AavC0OlqnwNbljqaOX0KW7uUeHxWGk=;
        b=EsHmOkpM7e9hiw+r2ccMxDqgTIC+SSB4K6XQn3DRQXIfnfGN2xRWrLsvLt9P9/2xee
         tWvLUSI6NsA7Pu2+olRsMnDb5110qiCJlXZ/2MWvHVbp1G7jF5JwZz7bK795zRuhMkEq
         fXOUeL/spmQJBTol1ZKhT6WsfnGJ0o4pryAxVIR/GSqsN7GsiHAiZ54QU6YkC1KTAnqL
         vZ8+4aOCHtRnOwdTLLjeuBqQLkiOIRYvt/de3x0WfblXxaj6NpGntvTrJMvmcUH0ZeN1
         CPCIW0gksPVUEiVdFBa83KiQZ2qjLNqb2TtbsckTglRIctu6SEgfQu6ry7OgnAyx2KT1
         gMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470785; x=1785075585;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aXFV6i8m5jYb+AavC0OlqnwNbljqaOX0KW7uUeHxWGk=;
        b=nyJVILhDgv8Zl285fEPwuxv/1ANuE6HphvYCyuP5mKPway3lPEZa0doSDybEoxVlmY
         athKEmygYvqZtkn33XT0Tzloh+blRAuekDi3OxMuB1gRJfYMnbPwFcsf1Jq0W+vzE28e
         fr+NQgrVw1BZDifDqO/LMX5xE5L/lkd6pQ+bVFdbEBuony9HPT3nrttbGiZRfLoMZBBg
         9oeeTcGiMvykzzW7/d57vLkGh9RFKJyImhx5x4uNZ6fpbopNSaaaXgYScuBBiC6RP8Hp
         rdA+hsqvFTQVmjA4OUbYkOZ8EPVo4NELo2uBD3j+joco+SGpIOmHjCj1ioiC2ANvW611
         gCfA==
X-Forwarded-Encrypted: i=1; AHgh+Rrf5V2LrD/jcUZT+rn1SsgY3ncMueW2EOOP+Z3rbuwsJXrkCMpS5mTMc1RHlWGd6/DdF/8l+RCEiP36Tw==@vger.kernel.org
X-Gm-Message-State: AOJu0YznXJND18n04ulVzL8MNWGzZ4FtQJOWFAc4ill7ZQZpbgKAhqtX
	rmEWronxqnlWoYDoQIzNItgA1JMiGCeWzr2k3YvZqgHgNrLWWpZWXL/5
X-Gm-Gg: AfdE7ckfogFTMrpET70ikS9L5X2t+RaTAHXd+Q6LEmHgYBuPXwldhdYdZPZNXkYZXZk
	/Le3RqAGS+LaoqyXe48vhOFsiDmMHC0lC3pAOkJKk//KliPmstVWH9mVskV9osP665rg9eR32Yk
	3OXA8ZyWozKdAKKm5ghF6h2tiDL0vDopfT2H42zkP8da5oN1Sv5FjYn3A7mhUUrEvJnEflL5d49
	sydIaXS6KyjTddoBBKWzNNAOWFk4gdJsZnlcYQBW/sc4rtRoyYNUGHs2gFfom/bolVrjOPwRQKE
	hIVc5WBDsJISJTaClExZn+EVPcbWBqSZUnvyM/jC8DnDoNl8phLrquhhiEL/I9B3nhqHc3u5MCd
	T6KBIJFHzcMQcjRL1J04mw34vEnJMGXSIkPeebQ9VRAQzKBoPwGaeFdCKcjJ86nPt7L42KjZCdk
	cGj0EVX04ASmjKMOA=
X-Received: by 2002:a05:6a00:9515:b0:845:2ff5:b66d with SMTP id d2e1a72fcca58-84c2945cce1mr10279994b3a.35.1784470784636;
        Sun, 19 Jul 2026 07:19:44 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84c2af6e9a3sm4154714b3a.41.2026.07.19.07.19.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:19:43 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:19:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Babanpreet Singh <bbnpreetsingh@gmail.com>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (peci) Fix kernel-doc parameter names in common.h
Message-ID: <5ebcfd31-2528-4eaa-abbe-a55418097d1b@roeck-us.net>
References: <20260712081258.7-1-bbnpreetsingh@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712081258.7-1-bbnpreetsingh@gmail.com>

On Sun, Jul 12, 2026 at 08:12:58AM +0000, Babanpreet Singh wrote:
> scripts/kernel-doc -Wall -none reports:
> 
>   Warning: drivers/hwmon/peci/common.h:39 function parameter 'state' not
>   described in 'peci_sensor_need_update'
>   Warning: drivers/hwmon/peci/common.h:39 Excess function parameter
>   'sensor' description in 'peci_sensor_need_update'
>   Warning: drivers/hwmon/peci/common.h:49 function parameter 'state' not
>   described in 'peci_sensor_mark_updated'
>   Warning: drivers/hwmon/peci/common.h:49 Excess function parameter
>   'sensor' description in 'peci_sensor_mark_updated'
> 
> Both peci_sensor_need_update() and peci_sensor_mark_updated() take a
> pointer to struct peci_sensor_state named 'state', but their kernel-doc
> comments document a parameter named 'sensor' and describe it as a
> pointer to the sensor data struct. The comments have been out of sync
> with the code since the file was added by commit bf3608f338e9 ("hwmon:
> peci: Add cputemp driver").
> 
> Update the kernel-doc comments to document the 'state' parameter.
> 
> No functional change.
> 
> Assisted-by: Claude:claude-sonnet-5
> Signed-off-by: Babanpreet Singh <bbnpreetsingh@gmail.com>

Applied.

Thanks,
Guenter
