Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14C3178F2F
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 23:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767137042; cv=none; b=repYL2uLT92Gi+4rdN8WTS+zE4T6hizv7fw1KEFqpZz+W0fto8trpV6NMej1wZ8FgPId76Pgb8xMVIUeC2z/7ppoBKGmJ9rIdAKJdNjXSYq6hyllzsgFD0SyvwBMZwWhDOXrAZ4qeDZoedq3t+Yyol3c0pMyztiOefGKbIg3xCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767137042; c=relaxed/simple;
	bh=LjbBW2Q36Makmb/gAD4hzKiCzz/88y95rFtv+Jm2u7A=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mewL8lyJDgw21QyPZfZK3q4pCTYaONnEQqL9fNT+MjwaTcXROKEAy5CY+XHXKgQWmPSluyboDfdfpJh4WI69GsztWi1rYv2SkDCG2AlDYAi3bW9ODS/nggEzOlDnO26amothnWTtYRSNHabB2UqHzHHfgBfMp0PfxbStOBDUzqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZFcdHRy1; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZFcdHRy1"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-42e2e3c0dccso6236315f8f.2
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Dec 2025 15:24:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767137039; x=1767741839; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y/CmiK/Q3cwHqOfM/u/AU0QZVLPb//tudEEUBiH1k8U=;
        b=ZFcdHRy1LjDTbaGkqR3etK+rJpS1G0TZFPgw6oKcPnp3Vn//ZLU30i5tArhu/hJ0k9
         HBcO7uoPVFvNLQdRIwJmMGXa0a11dz6M+RVxga7L33ftT/XQTGZhBZzRDq5EzJ54w+Cc
         aHK0n+1RV2IrHMgF8PQa4bxQxIdSUWQ2uAn+gfqKPZjzYGulmWKMhxkcd6E15bTTZB1y
         w4tsJVU6ulfMxsR+mRzHyLXqMrY6jl5L61fXlVr+ptvID7JbbVBNT9U8eYDTRRzlTkvM
         BcaqUJNU5tR7evwFaNomKz+OYvtuZN+fjqj+3YgvTvnjxotNEcXE5mqL9PEDifh63hQH
         /AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767137039; x=1767741839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Y/CmiK/Q3cwHqOfM/u/AU0QZVLPb//tudEEUBiH1k8U=;
        b=CDxT92lKyfGnun/uv/q044IGkvgg+hHTFdWB/hTv6DvdifGf7hHyhRddHggk+iMWGh
         tCnNQry8DOwUxE5zHLfm0EejscllAtqxm0WWe5fAB63+ryb0w4ACbwLQToGJHz1fq47g
         pX+BcrUOTN2osvSpEAqzSiYK7nW5H9bxX6zLh+7PsXCNU8YhiqsJVhQYG6MbYE4/6HtX
         VCkWUBUlDO4rtaF58JqXUlj8I+4jUImccB8sGfYxaAJtjjk4PmyNm/+WWUsK2BXYrg+4
         npFEJJjVplajFtcvwPz1J8n06nhJYpmGhTdeovvHnvqucP0ImYn9PRzzIlLGaa9XZIFi
         MynA==
X-Forwarded-Encrypted: i=1; AJvYcCVYzqg5DiGe9JMGdV+HbKSYPPN+e330U56R9baQsBCwoLMKHuqZLLF4OPEzMIHzN2P8UpgnsrIU2MNZTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI1XBNN9+5S7xh4aabnOah6zGImAsJn3+qhe5GLInqPQh/0CT2
	eCWGf9Eey/E8qlJQ8jMnUEagpbS60iP921wwK/ggdAF/2Xl97hR30DHP
X-Gm-Gg: AY/fxX7Z4JSZPivSD3HfrjtNFNZPnBcXkjj1t4oZM/sG7XsK/0riKzlPGY3KlRnAZlt
	URFaSwWkD+RMKNMybJ352cviLJZbLG5n3Hlh4XGxkvfsJtQ7vUaaSSQeAVHWihCOkrCP/Z5dCql
	kbUKj6NElDjRakxwVspAO8W0knt9fcnBR6r9AceHrH1XxAbFyNMaxbcXKQdosR7gvUZ8HzgS1Xe
	G5LDqXhf1G79IXmw3fdewWHWaU4BmVXZe+XT50EudvI8VBoqE9bVAMLPXcltTRT9n2nMb4hWoWr
	dJq+Um95bXlxW2vfJCfiQ9Z+JQBKlmITcAMZmksWzk+9LTUHQKZjPtquQrFeI2g7TAL0gXcktK/
	Xkgd8w6dYS6UwsTbcpHkkd0Qe+NGcyQFM137rRma/ruyUb1+n3NdQIXmzPqczXY6ZqXTiNiw7CH
	qN/LKLfVrlJpAStjAJHppbpiN795GQ2FZg8RmSlnuAV//3UlF4Wjgp
X-Google-Smtp-Source: AGHT+IF6DNAyogl6YxaD2hBlc4ka8Mkmjo/Dc79/8kGUKMpI6Ll+REF8hjSdqER8I6fSIQNxQ+guXQ==
X-Received: by 2002:a05:6000:2586:b0:431:808:2d3d with SMTP id ffacd0b85a97d-4324e4fdcbfmr41367739f8f.32.1767137039238;
        Tue, 30 Dec 2025 15:23:59 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43277b0efefsm37804809f8f.25.2025.12.30.15.23.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Dec 2025 15:23:58 -0800 (PST)
Date: Tue, 30 Dec 2025 23:23:57 +0000
From: David Laight <david.laight.linux@gmail.com>
To: SeungJu Cheon <suunj1331@gmail.com>
Cc: ray.huang@amd.com, linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon:fam15h_power Use div64_u64() for 64-bit divisor
Message-ID: <20251230232357.00222b64@pumpkin>
In-Reply-To: <20251230120959.199139-1-suunj1331@gmail.com>
References: <20251230120959.199139-1-suunj1331@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2025 21:09:59 +0900
SeungJu Cheon <suunj1331@gmail.com> wrote:

> tdelta is u64, but do_div() truncates the divisor to 32 bits.
> Use div64_u64() to handle the full 64-bit divisor correctly.

Looking at the code I think that tdelta is a time interval and will
always fit in 32bits - so the code is probably fine.

Also I can't see anything that requires jdelta[] be an array.
Neither can I see the justification for MAX_CUS being 8.

> 
> Signed-off-by: SeungJu Cheon <suunj1331@gmail.com>
> ---
>  drivers/hwmon/fam15h_power.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/fam15h_power.c b/drivers/hwmon/fam15h_power.c
> index 8ecebea53651..5e3692606516 100644
> --- a/drivers/hwmon/fam15h_power.c
> +++ b/drivers/hwmon/fam15h_power.c
> @@ -241,7 +241,7 @@ static ssize_t power1_average_show(struct device *dev,
>  		}
>  		tdelta = data->cpu_sw_pwr_ptsc[cu] - prev_ptsc[cu];
>  		jdelta[cu] *= data->cpu_pwr_sample_ratio * 1000;
> -		do_div(jdelta[cu], tdelta);
> +		jdelta[cu] = div64_u64(jdelta[cu], tdelta);
>  
>  		/* the unit is microWatt */
>  		avg_acc += jdelta[cu];

That could be:
		jdelta *= data->cpu_pwr_sample_ratio * 1000;
		avg_acc += div64_u64(jdelta, tdelta);
(or even 1 line...)

	David


