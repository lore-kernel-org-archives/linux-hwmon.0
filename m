Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F4E0174EC2
	for <linux-hwmon@vger.kernel.org>; Thu,  2 May 2024 18:34:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714674882; cv=none; b=jShNAffYZx7GfhrHzMAFdiXHmtLhvx13gkiD1/759ZMUb0/iLZlvx9cXuEsYXia6t6ma30ywCq4ST+gzW/YplXV+7hDQo4vrOOJyLCCrGvgu1p+wfNQxpmnPF4Xf3N5wGB3EvEPYq594YnyRw7Jhng52ls/CNfN4AlDtT72X6YM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714674882; c=relaxed/simple;
	bh=hkUdLfPttpQ9Uizzjig3dHmfdmmvYzwn26n5H3T3jCw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mJ3s5BDZmP3Nxr+4jVNT1/THGS10xR+XxmWEwL3LAi7/jrXzUB1oOIPmZQ1KAKtV6Asx+q0mbnSCUiJ23H9Fz4d4+E4RR7UMSwKbmRTc6ZxvPwfEj8VrXoo3nzcF8Yyl7zLisvdhSDu2T0Vh41+Ryb1tNBLTuGKDklymFv3LWrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com; spf=pass smtp.mailfrom=9elements.com; dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b=CGXQvnFq; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=9elements.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=9elements.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=9elements.com header.i=@9elements.com header.b="CGXQvnFq"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2b393d8dcbaso894361a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 02 May 2024 11:34:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=9elements.com; s=google; t=1714674880; x=1715279680; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+25HyXOoGfU3yjmqt9OUckjepNjR3C/KJDAxWQF5ZQM=;
        b=CGXQvnFqZsvP5ZzwsDHTs5ZFXeMn7t0PGgM+nEv7urTzHdMq7FcX+6grEIM5pjPa5a
         mPJbK6mvkArrCxE372YstWSkK3XmvGAoRdQ7wtnI2Et8sqdnkWcWhTWorweh6rv3rXLp
         OnDsbBKYD6Nd+R1Trb4zRreMHBnLbVgMqIPUd6WX5yf7QubfrfLLMfDSdscTcoSAZFgC
         11x89bt4AqLNhsJOXSsvIKPpwLw1nfmDXxK6t2zK47IJKmtW6dRSv84ySUeR937NUsNW
         9JCIQQFxV0HU8h7WjV7DfwrXTfn1VIZwAlme7s0HDC7q37c9Wpsrde4gT5TOuULP9Pdx
         ecnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714674880; x=1715279680;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+25HyXOoGfU3yjmqt9OUckjepNjR3C/KJDAxWQF5ZQM=;
        b=Z0TX9SxHYghiw1VU6eECAXzlprr/+PpeTP+hUfqrDagJrpziJPbgpJbvIfXwhSUL7D
         ZpQjqjAgZRfe6f9yobpIYCv//bWNf5n69bkzokNDurhkZfX838CAPUxg+mx2Djvt7Mgx
         VYsBvA/O0vh02LOu1nXdOthSKzlIIGykq7KG5EIAapZjUE1feWhVOG6eNqPnfAiUvyhT
         18asnMnX7TQw/7aTY67Qn04jWlPh6o+2Y408pqYoXspntpFpfnyuBNF7oEpe1GEt4I6i
         tX2tioQ8QXXDrTz3CJ8e46U+GvOoHXHyxrewcf8vKxd5bNfIRbuhJEp2q+JlXgTQOoFa
         RoMg==
X-Forwarded-Encrypted: i=1; AJvYcCXLEo63ZHXcs3OlC8c69zEybfJd1gYn2UylF46FOPrDy0vgzkjO0Uco7BaAUpxqLGBiUcQG2FvOeJiqoPkPI6VzM6rGgxGopx590Rk=
X-Gm-Message-State: AOJu0YxGA/sIw06OmtK+5mckyf8eLE2c7+k+07Q+QbunqSbg1tLoZ7Gl
	Depm0E0yuxuHvMBCDOQHUtFHSh3WorIP9XHWoyyuAWRPU20t2pfUbe/k+tNI7p8rkWLged2XZ+T
	B6VPOTBEtqjHXkQsZ9yXWdBZjjxsDuimTwsHFcA==
X-Google-Smtp-Source: AGHT+IF5E4mgToLIMVVlH/f2iwR1VecRyVXaYV+aFS7iLb6nTGbXf4HJT0JlfGzSaOychD89ASCLwngz5CgMoxT3z+E=
X-Received: by 2002:a17:90b:4388:b0:2a6:9c5f:828e with SMTP id
 in8-20020a17090b438800b002a69c5f828emr700244pjb.22.1714674880502; Thu, 02 May
 2024 11:34:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240430210539.935040-1-naresh.solanki@9elements.com>
 <52e7692c-abaa-4201-8248-3f42bb250335@roeck-us.net> <CABqG17j2kMEK98T90eudb_ZWftaV2L4_MdA8ML+v_cm3MHFs1w@mail.gmail.com>
 <af66ac87-32ff-48a6-bf1c-d7ac578ceb4c@roeck-us.net>
In-Reply-To: <af66ac87-32ff-48a6-bf1c-d7ac578ceb4c@roeck-us.net>
From: Naresh Solanki <naresh.solanki@9elements.com>
Date: Fri, 3 May 2024 00:04:29 +0530
Message-ID: <CABqG17hE+2F9y1=JZFRuJtLecFtx0XJBzt-a0HSyE3VRoqdzCQ@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon (max6639): Use regmap
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Guenter,

On Thu, 2 May 2024 at 23:52, Guenter Roeck <linux@roeck-us.net> wrote:
>
> On 5/2/24 10:25, Naresh Solanki wrote:
> [ ... ]
>
> >>> +     u8 pwm[MAX6639_NDEV];           /* Register value: Duty cycle 0..120 */
> >>
> >> pwm caching needs to be dropped as well. It is no longer initialized in
> >> max6639_init_client(), but updated and later used in pwm_store() and
> >> pwm_show(). Looking at the datasheet, the pwm registers are volatile
> >> and should not be cached in the first place.
> > Yes. I did that but found that the register is write only. i.e.,
>
> Odd. The datasheet says that it is r/w or, rather, that reading it returns
> the _current_ pwm value and writing it sets the target pwm value in pwm mode.
>
> What happens when the register is read ?
Upon revisiting the datasheet and conducting further testing, it appears that
my previous response was inaccurate.
After testing, it's clear that it reads what is being written & hence
it's perfectly
fine to remove variable pwm[] from local caching.
Verified using below command:
----
i2cset -f -y 130 0x2e 0x26 0x10; i2cget -f -y 130 0x2e 0x26
0x10
----

Regards,
Naresh

>
> Thanks,
> Guenter
>
