Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9BA1FCFFC
	for <linux-hwmon@vger.kernel.org>; Thu,  6 Aug 2026 15:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786030905; cv=none; b=Ezx8WOFPzR5Io2aqgjNg9C4uFKzWeDBmOSxuABltm8LWLj0LRSU+CuGIgq49E7pF1wDObf6hnZ0rLoqjuj82Whrf4W1FfdLVu0s0YD0Ow/pmwrw8jnK1MYYOnmwZiJzC7BNxdLG7/BwHbdweNAYcrklASA90YyDwvgJCxaNafoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786030905; c=relaxed/simple;
	bh=iqoViUL+W8JIToRLfqLUFgS2F8Y/sSS/MuhgHhILaRc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Frrl9qNZjQkiPj+34Bx+1hosfG4GHIgKDPntWw+qXf+iyj8tTefzuuEx5Qh4ORSDJECsGZta+WuGg0UuzDLMFQtc37RL6ja975yUGS6+iBNb0RGlRbLa8vLdCHD89Dt4XJajnYn1M1I8W6cG+x27taNZHVgMlzk+l5Qbw16Jggk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R7Hrm6YP; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R7Hrm6YP"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e69bdb0fcso2157113a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 08:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786030902; x=1786635702; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pbcRJcQr80BzSYesqBkGjr92cy0vInLAx8g3cWY9noU=;
        b=R7Hrm6YPuF25osWdL0h9bArXQGkX1GovREusNLY0CPm9RWvZ8YqJboXLp4tzlnKFO0
         GTp7CiZtBmgfnqytUDi30WcUaaLPO3f9PFxj9/YLYoqwY4HPyTcUnqewIcqkuTKeOnUQ
         9KvmwQo78aubxp4ptNchiSegmOCDoIbkKvSXdyenJhCwNtJpbIuP3wfMYzig+IYfc3px
         ZEkBvPp0x1bioMccWyTOnptruxoT5gjlfuGdU92LSox9IumcJikFLMbsdJLByLQYKm/D
         zHp+VAHdjg0Rp9/oPxpctv3KVTQ0TQVpPcuqgDnERIzFQCqWHFlQQWTe4+pSB/C/Bad0
         8jWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786030902; x=1786635702;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pbcRJcQr80BzSYesqBkGjr92cy0vInLAx8g3cWY9noU=;
        b=E4j+ZGKuSM3S37St+XSES8afzu2C/B4OVRVRsvEu4tMo+BhmY4mW0i3L+QJOMyZD3n
         NLM/3/aMuc0BoYiznk7Dx1ePonkGk10qFK/ojQketpQ2KJJZoDCfiD0t2jBTwj78VgZz
         VWFeJZEZQNVKCEJJ0lkKrb/RVMwP7GTf0KiyYd4VM9En1nVk8I0futZkpjuzpleP2PJq
         ohtfF5L6IWD2cxopEbUspLWOH17775nxHQ2i52nTvUiz/7IXqICHGgUQ15IW506eoW4o
         3TgjOg2n4SJ8uTOHX4gL9rtod9k8qQSxXQRucdHvmmq60I3AyYnNBsNdVrIiHF3csk5C
         Xwvw==
X-Forwarded-Encrypted: i=1; AHgh+RpW1cBtdYkRVzzsZycjvQbb2FM5e61O973yfB4atKlgwi0H2oT70fU4F35PgPQ1Zh1nXOH/XigzyLkAiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkiqiEvSMmOJKsucs7kkdy9HL42+3lt/rF7oFNyM8dYJYACbvE
	xtfFzwOd0I5spWb8Ww7KL77v+FMSQvOhUi7hiNDSQR+UpC9xWQRck94/BbZzjQ==
X-Gm-Gg: AR+sD10axvHgA858LwTtKQ4nEIr3iUHT5w6FEN4ri+UhaRJMvoWEf18voteYOAVFswL
	ojVrHgERhs0IKJZ2k+LcsQA3eKfaCXFKJbjnMozFJo8/1OFfuJwszupk4u8wFYY0HRgk/6gAuXB
	VAY0dMB1csYFdn7b0QsvaeTTjdDmftoW82oYzFeIrlc5ahDj8nbJZode92iwdLd8d209HWbsPUU
	0Yaoy7tFO9SnPPla2RiMpiO/YXXtL+Qrf6cMqVEmh1l6yVu4UUwws5RY+ovIm/d2G4KzH/zsizs
	9YvpCMs1GNFMMO1NdH8a8Xr9dMoTcv9vHZFsP36jZFi9YrPY9oxBRjmrGuY+3qKZjiSyOJf1Kxr
	amNJ5sHdy0NtCdCx+bvdSU+OUuQF0fiz/uvYGvZnFXCPKIFvZm99qr4Sr9CSnkbSM9AsMa+bEki
	8LCMoKczhD3+y2BJfFcZnlNHTZLdrDALsZsonM5gGopvfbtNsg98yV/c6XsAbgYOcpXG5gRBuQv
	SeJe1VJo+eS
X-Received: by 2002:a05:6a21:6112:b0:3b4:e4f6:4f15 with SMTP id adf61e73a8af0-3cb85e9922cmr19537654637.5.1786030901416;
        Thu, 06 Aug 2026 08:41:41 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca6482e7sm25736516c88.6.2026.08.06.08.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 08:41:40 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 6 Aug 2026 08:41:39 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ali Ahmet Memis <ali@iusegentoo.com>
Cc: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
Message-ID: <d8a81a43-690f-4850-bf3d-fc233cec2f41@roeck-us.net>
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260806142139.168611-1-ali@iusegentoo.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260806142139.168611-1-ali@iusegentoo.com>

On Thu, Aug 06, 2026 at 02:21:39PM +0000, Ali Ahmet Memis wrote:
> corsairpsu_request() sends a rail select command and then the actual
> read as two separate transfers, both going through the single shared
> cmd_buffer and wait_completion in corsairpsu_usb_cmd(). The hwmon core
> serializes its own callers, but the debugfs files call
> corsairpsu_get_value() directly and never take that lock, so a debugfs
> read can land between another reader's rail select and its value read.
> 
> The result is a value from the wrong rail reported as the right one,
> because corsairpsu_usb_cmd() only checks the command echo and both
> transfers echo the command it expects. It can also make a caller consume
> the reply meant for the other one, since raw_event() writes into the
> shared buffer and completes whoever happens to be waiting.
> 
> Locking was dropped in commit 4207069edbf0 ("hwmon: (corsair-psu) Rely
> on subsystem locking") on the grounds that the subsystem serializes for
> us, which holds for sysfs but not for these files. Take
> the same lock in the debugfs paths that issue commands, using the guard
> added in commit d1e720c7328e ("hwmon: Support guard() and scoped_guard
> for subsystem locks"), as suggested in [1].
> 
> The lock cannot go into corsairpsu_request() itself: the hwmon core
> already holds it across ->read, so every sysfs read would deadlock.
> vendor_show() and product_show() only print strings cached during probe
> and issue no command, and corsairpsu_get_criticals() and
> corsairpsu_check_cmd_support() run before either interface is
> registered, so none of them need it.
> 
> [1] https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net/
> 
> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
> Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

Applied.

Thanks,
Guenter
