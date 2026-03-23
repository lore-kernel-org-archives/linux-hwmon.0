Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF1EB39657B
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 15:08:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774278507; cv=none; b=i+5LWQBsf+PfUDj05nZyIjE9Wvf2qeGMQlm5oKbksk+rpqbs5XXmM9CjAxPKwBQogU2nUSkDtfkR4qb4URdG1NK7gXPUypqef25VX875A1GToY8QVVdunDRV7o3ow+VWAsuBJGt4LXGxRC5nPnIKmhMLNudoVVdQPQ19OGpYefc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774278507; c=relaxed/simple;
	bh=tQUiKGkowDIu+Tl6dcj/peQHjkWjzNjIUvt5xg5KILQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dVmxMd5aZ6cWJvcztL0inrzrcxgCHK6792QVvczBc0hkXcl6DBSLjmPxuDlo9O7knJuqj6FfzjD7x9kOaGmrvda12DutDRmouFSBMQfkILSZVmz5JVYnT6OBOHODplexvYECo48tsK61b087Qq+i0p5DxFAzsnBKesOrrChnymA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P53A/+4S; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P53A/+4S"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1279eced0b9so3981722c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 08:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774278505; x=1774883305; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=kh0mF/JIoDMNORbaWvnSYUV3LP1nFmIWld018Bg3S4o=;
        b=P53A/+4SFN1OuY/BGEhRzayc8XUqPIC7lvN73f/t0NsXGfEDWTiraUlFkDZX79uwKL
         dFzD1zlQvlxqIcRTZhhTQ83KFDsGHG9HZA1bKay/z7eE6LmMik1I55usMU1exqKb8DiF
         L9uKymw4dNv7NELwt5gas9uNILgrLjgXE3JZsC5/0ZBy5ASTbAgQm7d8VBQIhyXbHAKu
         qj8coqlBNJGpZmPzys8o8iaoEB5DaeSKBE9GN86tl03VbS8wjXBx55Vh/rPPpo5EJz4a
         XSrU/b0YheMgI4AOGPdwd3X1GjdLBFh8oXhy7BR7DxJAQH6JUsyOp/3jH4Ff1/HIXalW
         TLWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774278505; x=1774883305;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kh0mF/JIoDMNORbaWvnSYUV3LP1nFmIWld018Bg3S4o=;
        b=ruYvEmEdw+Q8J0Z+pnrtAVtgY/LKZV1i7+sUc94m9FT/d84k22alv8cVPD5P1AawUu
         pmIfBq1mFNONJYVWo+dv92jBtfCwPGGZzj0YL0o4YzmahsqwzIH0TapHAhjl+77fp2HN
         ps7AUftKg8msC7q/efuPmxXtvUH2tgvK3QNYVDUWFncczkC4M11Ypo0PU31ejUze/hu7
         vl9g8OHKfN/Uz0FXRsIruZj+XN4wOQSnELaxkg4X+uneXNVuwe8cuZDQPSJ2VvCZ7cUn
         7PUSGQb38hACDm9x51Lo0r/UL+1ONw7GanRQa9G3jCYPsK6GdLQeoNuOZW0cOzDxA76I
         BdWA==
X-Forwarded-Encrypted: i=1; AJvYcCU7CKKGswDIvMfTNfU3K91GvGvddqHuxTnL4gvFRP154rXuKeUT5GEDySidMHb+KWcipe3UwWOXIcFRjw==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd6u5QGWtwcF3iApTUr53PKp97yynvW4SYm7okMd2OkleBxKAv
	lEQHluEI+PNqifW9iB+ZsKq+9+3yYLOjq4pT4p5Wk2+JvZn6SXjNzb/Y
X-Gm-Gg: ATEYQzztAML78YFVlzAgpKqMlWNrcbdFyhoTa6VWZ7REdv1F192ZYScdmIixBSOKRkZ
	DlmAyq21VHXZG2ruOlIO2v+7Yf/ktTYbEgNwcdIh6qn6ypTWoTrmpTRnPoqDpkAHULDm3qEiob0
	/sIfRCH426J8ku6tqWfGIMMEMiGuF3BAewmUijZ+g2WJBNz39+ObphwW2ErsbPagn2mdK6uAAUG
	8qfz+/5D0hRQq+xmo2qeH6btr0lz4j2XE1pk6cIt5RWm5vieiuZ2wlM+PFTI17+Wu1zBh9MFJJ8
	rwhSo5MYoNNu3osCQdCdQ0HqkoDccSR8uFOvX/N5htK3qlZnPQzYCIISoaEbnAW0y40/ynVLxSM
	6ZmHvSjmGASainCeabVMz4dAMZOjqijrPeMO3zngIUvFkpiCZWHCZHMYZLRAuPA0nTIIUrZg8J1
	GfFUu3LdYSwS7W7ZTXlOM9I0MoEQC9xn/4lOshU76AlIya9crOMLgkwzyqfrHiokYQaJ84jbeX
X-Received: by 2002:a05:701b:2403:b0:12a:7f25:44f1 with SMTP id a92af1059eb24-12a7f25472emr1605477c88.34.1774278504870;
        Mon, 23 Mar 2026 08:08:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a733d199asm9063787c88.4.2026.03.23.08.08.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 08:08:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a49a7b9b-e3c3-4307-93d9-c4a7594bd73c@roeck-us.net>
Date: Mon, 23 Mar 2026 08:08:22 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/2] hwmon: Add support for MPS mp2985
To: wenswang@yeah.net, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, skhan@linuxfoundation.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260323061901.827025-1-wenswang@yeah.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323061901.827025-1-wenswang@yeah.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/22/26 23:19, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add mp2985 driver in hwmon and add dt-bindings for it.
> 

AI feedback is here:

https://sashiko.dev/#/patchset/20260323062104.827263-1-wenswang%40yeah.net

Couple of comments:

- If the mantissa overflow can not happen, please add a comment into the code
   explaining the reason.

- EINVAL returns need to be explained. They should only be used
   if the chip can not handle reading unsupported registers, and a comment
   in the code needs to explain that.

- Ignore the concern about the chip being left on page 2 after an error
   reading MFR_VR_MULTI_CONFIG_R[12] for now. It makes me wonder if
   pmbus_init_common() should explicitly select page 0 for multi-page
   chips.

- The alignment of

+		ret = i2c_smbus_read_word_data(client, page == 0 ?
+									MFR_VR_MULTI_CONFIG_R1 :
+									MFR_VR_MULTI_CONFIG_R2);

still seems odd. Why the large indentation ?

Thanks,
Guenter

