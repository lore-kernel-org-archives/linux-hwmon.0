Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28A64145A03;
	Mon,  6 Jan 2025 19:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736190622; cv=none; b=BnyOhbhRtx0UlJoIJsIrknX4qaVUbOCMSfYZ3XuZrFdQRPmx9iMxrMIX24zOXQI8YIQ/EQi14kDURiX1Ne35jTyY3zd1vaxpQi3yKO+XNwq7ShlLJVHyFhd+r5Qc1QWmrJ6bHVTaSGhPa9xFZOcQvvBjDr41jqAukv0acd6ZJjg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736190622; c=relaxed/simple;
	bh=PxmeU/vCXQMmQTLMUR5Q09Xx+W3lHL1r3mS0oFe++1U=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HtLyNAlW8+/R0AlgfQdXP3+A7Gnm9YLy/3Z8f2Yb7EUz1iPnVC+sCaw9r3dAqwGjjYBL0uOi0+8MzNe3mEp22ZbigG427KV8iczob+sIL79BnXVIGhMJ512INae1peFQwRLfeLxeGW2MGyFhf35WNMLfECmcCsAOsdYlHSUQajw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GilKLkVP; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GilKLkVP"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2162c0f6a39so220548055ad.0;
        Mon, 06 Jan 2025 11:10:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736190620; x=1736795420; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PxmeU/vCXQMmQTLMUR5Q09Xx+W3lHL1r3mS0oFe++1U=;
        b=GilKLkVPkJdoBYW1brg2LFwX/lIhO4RWQeol5Rmyj4dRkoGLSz3ZgX3Rby0Byumdfz
         AXXcmTULe5EdqFbFPDVbq6Dvf0gsLiFn89YDse6jB4mcJ6aVVROnPGJi89ZUbb/SmXuY
         zSHN2uFPDwzxfrto7eFjjOqftRSqQdyxK0zJiQsoXUy5boOSC6gMDB3TcQ8A0jgNoqPI
         kbizCEBiDP0CJoqLVTbSD2QDE0RwaFq+s0OAtZtPBaPl++YGHnSpeVGkFDZmtHYS2P/2
         +zdoA1hZRoMck8/k48O36YtvoZS37Xhd3UfK+PUtWBVL9H86G6EhyGA/YZ8GRcbmowik
         Qdqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736190620; x=1736795420;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PxmeU/vCXQMmQTLMUR5Q09Xx+W3lHL1r3mS0oFe++1U=;
        b=WPBNB6HQGx91eOUI2ASyWP1YWxpiId3U6ecHbXbjMZP9PGZPEVOLJ94pRSEI14Bfht
         D4E074Wt9AXem3/ww2VDieT/MB8K9+i7GCmJnrq89fRl0COijIErAYBh8dklCokp0y11
         MZ9l3bjQZsOlVFCunk8Ij79j8uMhXzhmFBQeNYiNck+ij9vPTUwvXO8rrEpQmoMP9qCV
         /lpvyJGzuHl2SdGwnJFr+hFSXtx9ljxwE1WABBh72cez7fY++hRVcdb3g/vg43KSq5Ue
         APPk+Phmx/D9shffsLY2ZlQV2R8FXel/S4DgJjTZVt5Q0zowHWNjawfeXoq2u0shU8EM
         wjBg==
X-Forwarded-Encrypted: i=1; AJvYcCWei4GPrx7QfIUHlexMJTN7TXmhw6GFgNDn1x3pPKEi8MVqAQmIcAuZxIM3H9wfsSzk6KVu8lQwdV9Dost0@vger.kernel.org, AJvYcCWoOfy1TqiFnwjphwzrwGb9WyQJymjuBtaQVi5sSpnUqQrAyEn4kEEfUbzMATsXG72hceErNbj8sk2U6A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwUbq880/s2/ZNP4HJ0WVrYCtfQ4yYggF1pmC5J9lrufDbhpIB
	FfAvqjkSVsHvz4ScTdEoh+Ie31MZhGqaP3XtwrpNuqK12+fLQLAH
X-Gm-Gg: ASbGnctTT/Mxx5pL08WIcuRW8bRX/yTbRmDcwQxUU2rpbTasUvymaBMKrMpxWFnVrHo
	rrmxpMXC+fo/NKkA37i9HsgK2nxWfi3fhuux+8iDQlYDVtgPm4Riq8h9e/caHi5Co2nVhh7OJT5
	rYIg005cnEyyetXVKCHkh5I9z5qjM5TF2mVrOl2hFg0b6OZ4uj4bJhOp2JlICIGt39nyWAo+ihK
	7cHN2blSvvz+NeOvQeqQhOwx1uBLh7SpKIdqMDvZ/nTH4D3i9osKHgA2znXCDKSCrywHhXckE1Z
	GcsRcZMQEXeEbJvWUAQfmL+WIkTlEw==
X-Google-Smtp-Source: AGHT+IFMxHY1oNc1isjdrsO9chTVQvsLHVOmgld6tnqquipzgGd9FfrS9M1dMIy74uKHKw/qTcceAg==
X-Received: by 2002:a05:6a21:3a8b:b0:1e0:d0b9:9a90 with SMTP id adf61e73a8af0-1e7374964f4mr646819637.13.1736190620258;
        Mon, 06 Jan 2025 11:10:20 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842b1ce01b8sm24845427a12.20.2025.01.06.11.10.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Jan 2025 11:10:19 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <894c78d4-35e9-487a-92c3-9a7eb808f040@roeck-us.net>
Date: Mon, 6 Jan 2025 11:10:18 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] hwmon/adt7470: create 'temp_fan_norm_alarm' attribute
 for 'NORM' alarm
To: Adrian DC <radian.dc@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250105195521.3263193-1-radian.dc@gmail.com>
 <20250105195521.3263193-4-radian.dc@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250105195521.3263193-4-radian.dc@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/5/25 11:55, Adrian DC wrote:
> Default: 0 in all normal use cases
> Test: Raises to 1 if all FANs are in automatic mode and below threshold

As with the other patches, this is not an acceptable patch description.

On top of that, it introduces a non-standard attribute without documenting
it nor providing a rationale explaining the need for it. Also, this is not
an alarm. The bit says "everything is normal". I fail to see the value of
such an attribute, much less as an "alarm" attribute.

Guenter

