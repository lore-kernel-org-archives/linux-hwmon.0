Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B265440BE3
	for <linux-hwmon@vger.kernel.org>; Sun, 12 May 2024 16:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715529855; cv=none; b=qD7LPCzgmPx3SwxjKRv+AU175/XjlDk/a6RSvYHinKLdG0UkREQuOrhGvGn5+cEM7L2oWgsQ6KfDVhi697CjCKjjNYFGu3dZTUv87x8vLj153iEFIc/dqYh4Tbyru1EYkw9VhrAel+PJbi+i6I/qVXsH7NEBHq/3gsF1BDBxay0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715529855; c=relaxed/simple;
	bh=C9MgJb/xIiZQVEquIJqkkXy5fONap3p/Ly3Ar8kxXGo=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=naHaDsBCXL6iGol2n2GPusJFnrtHWFILyXgMYZwXlNF6LCPE6w6e55h15IRrmqUk5kTfiwBlswc1O3vX6m1jFBerh/0dAjCEle3jksRVvhDblTyxEigY/nxRVk8uDEvYrq5sJMue1PWsmvXk5ttYeBQvppZCjYX4VJ8B2919SJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aIYnkBAo; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aIYnkBAo"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-6f4603237e0so2416996b3a.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 May 2024 09:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1715529853; x=1716134653; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3pSGdUXRpUK06Og3UUM7dNU6MVNkXMynyUNCTF6Qs2w=;
        b=aIYnkBAodAvMZMlHy9kp79w3lno/hV27pMKSK4jIWt4vWvQNAO1ecGYFksSP8V0Ud3
         RDE9URpmhqNtvhWY3jwsV5qTzPAl636oaEeZdp6qgcCQYMC/W19qDkbRCVcrrgBhHSX5
         cN+lel2thgalwGLjWilOCTzF2/KrBGbBmIAM/0mGSin3i64EXdU+8jJSEusHNjfVuh8m
         Vl37zcvqpkPzsvAS+a01OIi1LfPyrAhMgkJzQnfT3v4D9jiRU6Ygvfu1PvFNzPoZC9IK
         q5YeCtT9gbDofzgr9d6QCZAGn833BO8OYWqVOs0ec4FVDPk2+Xk70kgXZCTomuM+2qYL
         z6pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1715529853; x=1716134653;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3pSGdUXRpUK06Og3UUM7dNU6MVNkXMynyUNCTF6Qs2w=;
        b=P6UcBjy1NNhPBt7V2lXxVSqWVa7JrX9xllVQuI0AQUlyVNQcpsnL34HgSZw/dw/a1+
         FW9A8ee8vU+rkJE534FbjJx4xTPi+/XrLUEMww5xy0JwBhF+fIC+JSrQHo1+81j4RgHB
         kZSuJuPll3Zuocs45BlpdltZZQeJfCR0v0RhZg97EltgP4t5+9YwxgEAhgTUwZVYIZsW
         r7W2N/HV9WwcxwofDhJkblLWnJrk79HMfl9D5oQpr/YZHYhfXunYZkRpfeX7Qcc615Y1
         2COa/MFQVSi3Rc0o7yeD/P4G1kdqwVBu5KNc+H3NKFqmuie/2RHQtNAA2gtEvIA/xdqK
         wXIw==
X-Forwarded-Encrypted: i=1; AJvYcCXykCypssMwiciv5PTnx1Rzut99yYRPW6NoLKWC4YkDOzXgKSak4JgU9QhYnCTcH31x+T6/PBkMayaIBpRPANfEyUMvbSzOwhCbsJY=
X-Gm-Message-State: AOJu0YyETIfPZpCFLJQEG7r4JRk4d/2+7Ru6bnkmCJvQ3gejWF3Gscr5
	DAUoB3UOAG+OQg9J8lYC1d8FxjMFDLa0Bd3ElaGyAyNP00PUNt+yHJWg5A==
X-Google-Smtp-Source: AGHT+IGxndUTYYX0wJzXMXdkED+zS68Egj1f9gQZoyEINQku0MqeQkbEAoRY3dP2n07uIi+6VspVYw==
X-Received: by 2002:a05:6a21:394b:b0:1a3:a821:f297 with SMTP id adf61e73a8af0-1afde07d85bmr11996693637.2.1715529852913;
        Sun, 12 May 2024 09:04:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-6f4d2a664b2sm5850004b3a.42.2024.05.12.09.04.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 May 2024 09:04:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fa1d0093-6643-45de-9686-021b31d3c232@roeck-us.net>
Date: Sun, 12 May 2024 09:04:10 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2.1] hwmon: (emc1403) Add support for EMC1428 and
 EMC1438.
To: Lars Petter Mostad <larspm@gmail.com>, linux-hwmon@vger.kernel.org
References: <20240510142824.824332-1-lars.petter.mostad@appear.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240510142824.824332-1-lars.petter.mostad@appear.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/10/24 07:28, Lars Petter Mostad wrote:
> From: Lars Petter Mostad <larspm@gmail.com>
> 
> EMC1428 and EMC1438 are similar to EMC14xx, but have eight temperature
> channels, as well as signed data and limit registers. Chips currently
> supported by this driver have unsigned registers only.
> 
> Signed-off-by: Lars Petter Mostad <larspm@gmail.com>
> ---

Please provide change logs with your patches. Also, there is no such thing as
a version 2.1 of a patch series.

No need to resend, but please keep this in mind for future patches.

Applied.

Thanks,
Guenter

