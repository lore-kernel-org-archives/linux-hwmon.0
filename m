Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD838282F2A
	for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 20:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792008717; cv=none; b=M+UxKJ/ZrwpJy2elifEfwdzzGPPUChB4TTAiDXBRMwHCeFi5hyn4qLF4hSuRRfSX+LgL5su7SXvXx5kuqLXh8RBYK9PvJsEZKjzaBMyk0LTmIa1Wl42fIiVXmsTjUPkwyAiSKfemgWZzvJv/JDq6gpWkFTd2dnZMcnZB/h5iKc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792008717; c=relaxed/simple;
	bh=S8jHugwfc5mGzTXcxYeryvcS4QP8GMhXuGrtWSeI97U=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=sxc3P7K1ZedC5IifuLrZQ9+pt6/WB0IAOmtpaz3D67MGzLA5OI6l/0YMlqRDD1Tc1YV/TDocrn1ryt71GCZuprOd/BKLpmbWonUZB+pcgZn55QFSZexf2YUPbKeBvByILbLDiLJi2gPYliqYdeQwXCgf8mIRr9/oHccK4xs48WA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gesxcdL/; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gesxcdL/"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c315869241fso205943266b.0
        for <linux-hwmon@vger.kernel.org>; Wed, 14 Oct 2026 13:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792008714; x=1792613514; darn=vger.kernel.org;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B3NN1XmnvWDLl28EZgPw9HFna8foW+yV6qgfgucgqcE=;
        b=gesxcdL/2hkQZ/2AFXbIDVERFLGsaUvjhUJZwr5zdCJsIasytTqjRENLYnejZaIVUW
         DjxJgD5Gth/G0qygCYYAace/xlQTV5GOMA3nGP9TmpqiHOFGiWiMTZsJ1O9eM2kcz4So
         siFy0E+VoFL5LoBQeepR07sEU+IGl7nSVHMkS/TOzu7BgnCORC2GMMvBVb9m6lf//BfR
         Ri56+X0O6IZRk6JyRNtwUWOuGB3lSKZM9OJmiW4Mn/koXF3ZPtKtcSGQGWffEtjf8UuP
         sqSlN+H0ryKsaam/yrRcY9Pq/4ZOreYnjyDmhIo5Y9lH1EFt7kVYdxs/25MNirlLIY9K
         HMIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792008714; x=1792613514;
        h=in-reply-to:references:from:to:cc:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B3NN1XmnvWDLl28EZgPw9HFna8foW+yV6qgfgucgqcE=;
        b=I0agWKZwKiup+uYlh36lb0rSsJcGg7y19yqzo20zTifF23e5UcP9WNbd8uPWZOooFy
         EKhQVhJAErW5an4S6+91c9Hoz8OGC4xnYKugpXUuQgxA2X2zadAXfwloReeu7i1335dP
         172uE3+Sp7HQkM2fOZtH8fW6hJ6+o6uZVbQa/k2X6ysKdab4BM6G7SjHaZgQ1fqjDCkb
         e5vuajIslng/HOeDSuDtTVXONd6AICNNexZiKf6bs5Z5zWr0FrtPvEmR/ypUg0kP5Wtd
         6Ywr+GE9xvfC6onYkprUZkOzgTOeNhC1NUGjnmj7KOvJk1vbyQOPVL9mt5YHO2L0qOlr
         NwjQ==
X-Gm-Message-State: AFq9FYJhxzIg7eoSsoNaJxYp68LP+uqvqDfJak+YOpV3r39J/yIeFVx2
	TJovzMv3a4U0l8EHbu3QT23m26CAhX9YcX22kVFM7gGn2+RnBq7caXYjKLoqY+Tv
X-Gm-Gg: AYBFou00zZFh4xWlvxcsxyg9zX3OwGOy8j18uafN63n3lvHdPgn+dayraK9f1pVJkBc
	6yDyWAhH5MNU3k+m3qeKdr4qj3+4/mBN2k/hS+6o+o9uE/Qhy4aM/f1IJNDEIPn4RC5WJhBzXUF
	J4+ctItazd5ufkX7ryP9lpeSpNr80nbVcDls8vfihdY7HxTLl9ildRth0q9/5YXOoSWcyHNVw0D
	0Zb/Re1zajxyRNdvdQxa+fNyJssO109Y0LXb+jqaNZp5aEkhAmGKj8eQ84TKO/fOyHKJmov2S26
	FpWUS4ywJe0yDHm8fosLbKZBuIc/NyE3wMwlXTGMeiMOHqnjyc5oV7u9HFdDXUHZvzTdDyptUFA
	oSyL2LsVwAQToTF9tO7gFIJK9svu6IinAd84bHLiaM/1iE9F96AK+Ik1n/RAvcrka4U8bKeJqMG
	y2LWcg8kVpSNYQt1wKa1cgyVS6Y8zyYVUJk9/XBoW67+HQ+S7kdofBggGyrmrnL0O/z+hGozuJ3
	GjTNiFqpiatBg==
X-Received: by 2002:a17:906:ba8c:b0:c29:cfce:1946 with SMTP id a640c23a62f3a-c31a9b0d1ebmr1511912966b.15.1792008713693;
        Wed, 14 Oct 2026 13:11:53 -0700 (PDT)
Received: from localhost ([2001:4bb8:148:f08c:b8ea:248e:71e0:692c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3eda042c0csm24638166b.50.2026.10.14.13.11.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Oct 2026 13:11:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 14 Oct 2026 22:11:51 +0200
Message-Id: <DM4U2L9VCAD7.2DJ6C8P1LAR8@gmail.com>
Subject: Re: [PATCH v3 02/11] hwmon: chipcap2: fix off-by-one in command
 mode retry loop
Cc: <linux-hwmon@vger.kernel.org>
To: <sashiko-reviews@lists.linux.dev>, "Javier Carrasco"
 <javier.carrasco.cruz@gmail.com>
From: "Javier Carrasco" <javier.carrasco.cruz@gmail.com>
X-Mailer: aerc 0.21.0
References: <20261014-chipcap2_locks-v3-0-27ebfc2c5b9e@gmail.com>
 <20261014-chipcap2_locks-v3-2-27ebfc2c5b9e@gmail.com>
 <sashiko-outbox-171645@kernel.org>
In-Reply-To: <sashiko-outbox-171645@kernel.org>

On Wed Oct 14, 2026 at 8:01 PM CEST, sashiko-bot wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [High] hwmon: chipcap2: premature timeout due to 1-jiffy wait_for_compl=
etion_timeout
> --
>
> commit 529f4f489744495e9cdde8072b4894cc25895048
> Author: Javier Carrasco <javier.carrasco.cruz@gmail.com>
>
> hwmon: chipcap2: fix off-by-one in command mode retry loop
>
> i =3D=3D CC2_CM_RETRIES can never be true inside the loop, since it
> only runs while i < CC2_CM_RETRIES. Use CC2_CM_RETRIES - 1 so the
> last failed retry breaks out immediately instead of doing a useless
> disable + 80 ms power-cycle delay before the loop condition ends it
> anyway.
>
>> diff --git a/drivers/hwmon/chipcap2.c b/drivers/hwmon/chipcap2.c
>> index 8550578928523..8102b6851d3d1 100644
>> --- a/drivers/hwmon/chipcap2.c
>> +++ b/drivers/hwmon/chipcap2.c
>> @@ -226,7 +226,7 @@ static int cc2_command_mode_start(struct cc2_data *d=
ata)
>>  				     2 * CC2_RESP_START_CM_US);
>>  		}
>>  		ret =3D cc2_read_command_status(data->client);
>> -		if (ret !=3D -ETIMEDOUT || i =3D=3D CC2_CM_RETRIES)
>> +		if (ret !=3D -ETIMEDOUT || i =3D=3D CC2_CM_RETRIES - 1)
>
> [Severity: High]
> Can this still cause premature timeouts during device initialization and =
reads?
>
> Looking at cc2_command_mode_start() just above this check, the timeout
> calculation evaluates to exactly 1 jiffy on standard HZ configurations
> (e.g., HZ=3D100 or HZ=3D250), because 200 microseconds is significantly l=
ess
> than one tick:
>
> 	timeout =3D usecs_to_jiffies(2 * CC2_RESP_START_CM_US);
> 	ret =3D wait_for_completion_timeout(&data->complete, timeout);
>
> When a 1-jiffy timeout is passed to wait_for_completion_timeout(), it can
> expire almost instantly if the next timer interrupt occurs immediately af=
ter
> the call.
>
> This can cause the driver to prematurely abort the device initialization
> without triggering a retry, returning -ETIMEDOUT sporadically. This leads
> to random failures in device communication and user-space reads even if
> the device properly signals completion within its 100-microsecond window.
>
> This same 1-jiffy timeout issue also affects the EEPROM read sequence in
> cc2_read_reg():
>
> 	timeout =3D usecs_to_jiffies(2 * CC2_RESP_EEPROM_R_US);
> 	ret =3D wait_for_completion_timeout(&data->complete, timeout);
>
>>  			break;
>>
>>  		/* command window missed, prepare for a retry */

This is a separate issue from what the patch addresses, which is the
off-by-one error in the retry loop, but it makes sense.

I have never observed a timeout during communication with the device,
but statistically, this seems plausible given the conversion from
microseconds to jiffies.

The most sensible approach would be to send a follow-up patch that
ensures the timeout is at least 2 jiffies, regardless of the HZ
configuration, using something like:

timeout =3D max(usecs_to_jiffies(2 * CC2_RESP_START_CM_US), 2UL);

The same change would apply to the EEPROM read timeout in cc2_read_reg().

Best regards,
Javier
