Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792440893;
	b=QGjy1Kj0TKr2+QoNDzrwCRXnbm0jY/sQTVAjDmuRvfMSChWre3Ms2wLTGxuvgECoGbsP
	 RnhiJXBgat/fFGoUcnWh2u+hN3sswwDYuufkTs0GweFG+N3YQSt4HnOeuKzIyYQ2hTQlS
	 LOghlEREqBGSKZ8g9nqqEpvRFQgaXyciSCfoITzwMZWGcND5d1qDnGeJ3TGTeBeY28paw
	 oMbYklpLyOvh27tSoASkVUG5geANi4LggSIstnsqYrmptp4k1jnwTad7jsyqlrVVtSiVr
	 X12m+9DdTOZaSadLzehMdwhQi4v1zKqvE8H5T6D6qpPTtuY7Pt/PMrxPUk2kf2GR4Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792440893;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oQVCaAkV0nUoaKSyLg9GT6qsRWzMjYulUhdrI76TIPE=;
	b=QREuTMmIldVf6HvqHJdRYAmpBL3kMRlhl+E+GriXtDYcAESb5X3upGBnJVt/EJItOjhW
	 b7Kn+r9PTgMJficA/aB59cN3XhdTlF/UXtfarGjHqwh4ZVUM0A1tYsSzaldUs16AvvRm/
	 h4OqYdSpooX009F7yjfMMm0xBNf8n8oMyw4TUZY1VcXv7C0IQCkp2kNQaUBtT2Kk/tgQR
	 VCoacLHu2RCtuclRKrm+k9A3F+IV0DJFz3IG1FenHZgh4bWAL9tlendn/HeuI7Eot/3Q5
	 6e3WHWb/dZrw2kRhOp206AMLRLj1fiHek6TcRF/Sd3m1BpygkknjmM/DESJf2QyNq2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Anweqe5Z;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 210AC606A319
	for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 20:14:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 210AC606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=Anweqe5Z
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-35cd4e8bdbdso6166691eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Oct 2026 13:14:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792440892; x=1793045692; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oQVCaAkV0nUoaKSyLg9GT6qsRWzMjYulUhdrI76TIPE=;
        b=Anweqe5ZTFkrYcclK/KD56rcmqDnRT1+BXJo18LRYRypG9cNMzYyc/Y0yUKU3JCHj2
         raYJlpr6JDij4x/T/Ada/UrEbGoc2AU3qZXdc3h9Qt0tk2D6XKkIDZv6ETmv6wi6Q7D/
         w+Z5MvE8PSOo/j9egOQYkKb8qLc9c8vfglXXCPuUtFUiaGQCSSK9EV/lNy4yKJZZ3ZlH
         1GZLlTB/txEhTJ0R19xypm9vPa2oowaFCN++qPGZtt+Sr8Qvn0giI5LzNB7jPhD9ElNI
         EpuBsJYVDppcNPvZ4uDA+EWpDG8UQwdg3pl/FdalCDz96kgvotBpaTFWNsWqVstRuYCY
         IeWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792440892; x=1793045692;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oQVCaAkV0nUoaKSyLg9GT6qsRWzMjYulUhdrI76TIPE=;
        b=CqTAlGs8LiPCU9FjJr7co/33tVof3R39NEu9sdQk33ATJxL3KI2/7h9AAKFwX7ZIg+
         0ZduRM1lPm7PkAgp3KpBV65yUBrhPA2tFGsAxagVLLoEDiR0Jbcyp6hrYWKd7lbWRvb8
         Zc8qqAyxLWGGng3OKT6z4Lh1HCeFmVgaoitfQy8+sChl3U79aWkTjjqAR2+ZoLk+DvQs
         8rR50GnEY4OKOsycBr7N3/vlPMiGrE00iuZX3jcR3sKUqlO6D+WT78/dy8cu/pcIaaFK
         /d6nwTdMo6IMloa1qszybVgoOfcH6Ph8b/LtplswnNCFyf6eTi3v4aYLp1z9ZOB8MeBJ
         FOAg==
X-Gm-Message-State: AFq9FYK884kSX7fO3+LCGvSdGAOoA1NpaMC+ua2EzlMnigr5Yf5tz4xM
	IS+J7m+Rwcj6vO1dQCvkq3fFtukkg2g8c7LEE0xcBifdkxZSrZ78z3rW
X-Gm-Gg: AYBFou3OJRWszCJizMnVO+7D7buPvYuI9K3/nclMPVHDbFcZK/jt9ekKvDNooUZj5Z1
	ePvtA5c+HyFxLJKCGuwngm4oU4eXSrcJXz9t6iXnxrBY7bK3MhesG6AzDvLJMqXeJ9y1GYndLLZ
	PuCNRx9REB5JJqS3msDe4sZMrTuHwFwUMnHFkV5ovin+Se+ZPAk5cKJFj2fGZ37uYpBH6tWMbhy
	UEIwzt7VGCpM1lmLX2UokJNjO8PNW13eqgayYvTH+/dDiGZcXHjrH5ERsrFbQRCoVBA8bmydAoJ
	wk7RPeVAaxyVjkHw/VlP/qsCKE570QfNfUlBBlUxSqqXFMtm1xyXTJbVNLzooSVAus1ELnxf7vX
	z/PeyAPMEHb3v7g0yC9ZQKlSuk1UWoZywkz10DXKQ05eOWmBvs8VmLPytkONFLLKJToA4oyqcf0
	Yau4Rc4KnXIqZHIRygoNwBboYdjCssAxLdC2+9DucBHfQkpWWtRzlkxI6A22jHBOUR+bpIa6ct3
	blT8f+6SFlP
X-Received: by 2002:a05:7301:1888:b0:351:595f:a941 with SMTP id 5a478bee46e88-361a166778fmr10951992eec.8.1792440892146;
        Mon, 19 Oct 2026 13:14:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-360813b63e1sm36150114eec.8.2026.10.19.13.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 13:14:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 19 Oct 2026 13:14:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Baek Kyu, Kim" <pocj8ur4in@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (sht3x) Return the consumed count for heater
 writes
Message-ID: <2092a948-c425-4ed6-bc21-efe572498358@roeck-us.net>
References: <20261019154718.2328055-1-pocj8ur4in@gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261019154718.2328055-1-pocj8ur4in@gmail.com>

On Tue, Oct 20, 2026 at 12:47:18AM +0900, Baek Kyu, Kim wrote:
> heater_enable_store() returns the result of i2c_master_send(), which is
> the two-byte command length on success rather than the sysfs input
> count. This can report more bytes than were supplied, or a partial write
> for a fully processed input. For example, writing "on\n" returns two
> instead of three, so a caller retrying the remaining newline gets
> -EINVAL even though the heater command succeeded. Retrying the remainder
> of "off\n" can also send the heater-off command twice.
> 
> Return count after a complete command transfer. Preserve negative I2C
> errors and return -EIO for nonnegative incomplete transfers, so a
> zero-message transfer is not reported as a successful zero-byte write.
> Keep the existing boolean parsing, command selection and locking.
> 
> Fixes: 50c22cd154e5 ("hwmon: (sht3x) add humidity heater element control")
> Signed-off-by: Baek Kyu, Kim <pocj8ur4in@gmail.com>

Applied.

Thanks,
Guenter
