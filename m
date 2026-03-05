Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E243718C03E
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Mar 2026 00:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772671713; cv=none; b=eCBDaCya0FaiGMpmN7PLRlgsrASKtmbeJ7ClZ5CL4l037RRX2O/Y0XmhbbHIHIxJogLdpmdh1Q91GCJfziMRsGRbFT4cueylZBd2sSadz3GnHU065HVi/fgahg7LyWAVxrjuD2k8KVga74pbEpB7CEDqdvL+6/bj88Jigh9Sq4A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772671713; c=relaxed/simple;
	bh=+cHUrKIwKCcOSYxTMhBRUiIJ3LdoSqdpW6FQuJv5v5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DbzGbEXYayF2reXYFFxh9h/0nd2MIBmT4sCbJ7LPAmdcQZgQ38bwmSEPjFoR78phFvyC0LGzZkfwAdyNPgNbQKS9MRI+3catbZkOMK2tOAj1TZ8o39QuiVnzTWz2aJedjwnXYhGDffnJG18P+HAmwqO1SIxkhhvX7IPp6Wg8bH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GEJu/oJb; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GEJu/oJb"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2bdd40d3c61so6187341eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Mar 2026 16:48:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772671711; x=1773276511; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoznNke4cEg/GrmSp3xe7LTz3Fq6pjHbpyo75xgOYas=;
        b=GEJu/oJb0ONNoAwjuKWn+E3RQwSHUrOpu+sCNh9bMIChnj3yDqxgHixIyJwq3xPPr2
         7+iztxlIQP/ub7qyhmsfV6X4dGsYkTwfDwZeHlAkDmCHPsWpHT3Aq/MKNqkQ6jbVl3IS
         dlB5cWVDijL47ognaMWLPOc4+8mRVfUPoISAWuoQ0Op1jPt3RfcEnbWis7/wN0J7A6OB
         +8SaR2IAIb/BKwV5VyP45+GV7S/2KhJKZBlluymKSrZscpp3fmmRjJQrJekXxYGaqyE2
         S1mfUdFzSIgBWLeGcWrOtzi42GeBzDwN0hHjmdO1wK1ZYC3LfCC20dm68XKSuIGJGx9h
         6sEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772671711; x=1773276511;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FoznNke4cEg/GrmSp3xe7LTz3Fq6pjHbpyo75xgOYas=;
        b=O8NGkx1+Ic4EYHOoVg7Cgdb+l0qUg6zaqmyxIUHMwZyys/yVPseJuLL8lfzZA4Pf5x
         c6LNx1FRe+bpsuwOllBjZfWYurhmElupj6lmqLDKiQoumLj0Al3dwJA6uxDIBMbTqCtm
         AeI197jZMG/P/LfSiREpY4UGGlj7/IBeuMTnsmY5M8tZe1gRY/992M3GQAgh/JbxZhKJ
         UhCXrG1zDWbZe7wwRkJCOVl6lQFZ9Th6Scaz46+oLWaXdFsvx7kMzw6HT5hX+boDIDGh
         ymRs4LyTEAPooE4nDpB9CEirw3ItD9+mRfg74p+t+au2gDdrd3kZS4chLf0YtoiAdGeT
         uSeg==
X-Forwarded-Encrypted: i=1; AJvYcCXDQsyJZ9FkYuvj/YuRWFZszxu9LMQNXfm6UsDYxxBySxgDbIfy12/XHpGnt59bqLaJ22QRYP2gyYzckw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxA2JU3TDw+v7s1GFWxYdjVP/UuAhdUDg5NYw9Om6HyEdW17UxI
	A5PWHWmd68Rnwtt3ZuOQiY+NrIYm6WWb2Oc6heqEEXiDSLharadW/EPM
X-Gm-Gg: ATEYQzxaC4aZj8PXdq1BYbRr2lHFSqR4enKwVMeyuPCWKEjJvJJlVUUTAfp2tTGk5uq
	LsqyYQJfe/Q8TwXDFxl3DDinSqD+K5j6fzAudCRQ1olcHy6lUhmgP/c/G4zxWtYDLJ2bMVfMje/
	J1aJf1Idx/LFfkVh5TqEh3ux3KMaE0OhjODBMwWNNH7jY16svL/ZA442JBAYGwVS6yrwShJDtom
	hYmOzoAKPm4sL6716vFT5jxcvzY9joCPSS9CdjxfvTozMcHEeL580FfSlLUCL1Wg96pgYHzXA2U
	zWK35/VmoYjxnrmyaZWFMnjxXzs+Mse5pVqYxwKd300HZ2W+WBguswVgXo4+8KTkYJLUuGb+gef
	ualM3twzshUY6r7Vxq7raFo1pIVfZGKNAifsZucY0hyl7+32IrkEH/Bp9TIbeW8d4r6RfRRlZbh
	itj7cmlCvM1RAxq9a/MoVzEao1P4x2x34+lESx
X-Received: by 2002:a05:7300:ef97:b0:2ba:6c38:c79e with SMTP id 5a478bee46e88-2be311bce57mr1388943eec.28.1772671710895;
        Wed, 04 Mar 2026 16:48:30 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bdfba0df2fsm12447029eec.7.2026.03.04.16.48.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:48:30 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Mar 2026 16:48:29 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Sanman Pradhan <sanman.p211993@gmail.com>
Cc: psanman@juniper.net, andriy.shevchenko@intel.com,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/q54sj108a2) fix stack overflow in
 debugfs read
Message-ID: <cc805b7e-e6db-475f-8311-1f0fbe752662@roeck-us.net>
References: <e7191c1c-ecd4-40f8-9e47-9357bd82984f@roeck-us.net>
 <20260304235116.1045-1-sanman.p211993@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304235116.1045-1-sanman.p211993@gmail.com>

On Wed, Mar 04, 2026 at 03:51:17PM -0800, Sanman Pradhan wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The q54sj108a2_debugfs_read function suffers from a stack buffer overflow
> due to incorrect arguments passed to bin2hex(). The function currently
> passes 'data' as the destination and 'data_char' as the source.
> 
> Because bin2hex() converts each input byte into two hex characters, a
> 32-byte block read results in 64 bytes of output. Since 'data' is only
> 34 bytes (I2C_SMBUS_BLOCK_MAX + 2), this writes 30 bytes past the end
> of the buffer onto the stack.
> 
> Additionally, the arguments were swapped: it was reading from the
> zero-initialized 'data_char' and writing to 'data', resulting in
> all-zero output regardless of the actual I2C read.
> 
> Fix this by:
> 1. Expanding 'data_char' to 66 bytes to safely hold the hex output.
> 2. Correcting the bin2hex() argument order and using the actual read count.
> 3. Using a pointer to select the correct output buffer for the final
>    simple_read_from_buffer call.
> 
> Fixes: d014538aa385 ("hwmon: (pmbus) Driver for Delta power supplies Q54SJ108A2")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
