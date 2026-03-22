Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A90C63659EE
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Mar 2026 00:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774140518; cv=none; b=a8blVZxfGn8godO8ycJqQAaedwGsyz66EIMgwBExX18EVvooBNRbkbe8fkbcWt1fODOVSLpGk3cZzNg7zSrLoajWxSnS2yIKohUidb3bCrIImOHgJiwAiixXvyguydc1lqaIsNaMWYbKwfMHLnXpi4mQMOcQR5KDlJ9KnX+LQEU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774140518; c=relaxed/simple;
	bh=V5WRkCJHzIrXr87+o5TQ/ALxhtHk4PoeiiX8S2iZklM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DkUpwIUU7gof5WjgnoruBQXQSPb2mMp3Zp0gR4qZjUn99x3Vv79M/zrfCyMn8Vq7/kytaeJ2uSAIHvJfv11wT/GNyH/Je07WftERUWhYz29ZnOzyxAPytghkqnmw+U0PVC50g0ZWcyQaPdBtSIm/kuT1QcmYZn+JxA7+K74BLmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DbNGAY/9; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DbNGAY/9"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-1271195d2a7so3729670c88.0
        for <linux-hwmon@vger.kernel.org>; Sat, 21 Mar 2026 17:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774140517; x=1774745317; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7ypVVwYVlbopSDphceRa9MZvf3B6YF20jbmBqHaZudg=;
        b=DbNGAY/9o9CI6BRWzxE71Ot8PYNmH42XMCo8ZjHpsg8PA7R13oFwxrVXXDHyTkKOhN
         Sum5bpv6MEa+vRhtNaMKysb0juA9TKD21GAUHON1v5f3Q1RFFkO2ImKLZRR6JCQnEAnv
         i+duJyTuOh/b6dGjJWH8CLYrCMgjyK0bfmtvgYp4xvN5w91dBYsgzAcaEy5CT2B8+4ql
         2xZuxhEPRNppG2SxNuoU3PHPNNcjnrKxs5Fh32//b0JUFsqBbS74U7fq2TyX2hQFCLmr
         4rd0Pi8xZYgAVu0SHyYgK4ZiR3ltq48hU5ynx+47OCj2+fZK21M9aEz5JafNosV+hUCN
         ciPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774140517; x=1774745317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7ypVVwYVlbopSDphceRa9MZvf3B6YF20jbmBqHaZudg=;
        b=Rfw2VAZkaUf7XwyLzCt8gH5XWzzZr0TGh0KGP/FLonmDORqVXrNZjgEC2RiPXFdV1e
         HpGuUsdp+R6N0Bxp5a79kX4Iik8MFI4F/DJWxtod14SRmgLwKbgNwntIsE1LOtzQBV3x
         K3/3w+atqg8e8SVgqBITJVpunN53XFXMHGy/NtP2pXKnsfpeccCIGtWSrRWsM+15FvZz
         uE3xw5yfieMVqityyspl80TIIqcB3tv4Y7qlI2hGuwa1YdqGIajJlx1KubnxheVOYMGm
         Kg5j1KHzpdknpyziGF4tStnBChooZmjV+hd1i8PRgXxEZ+Trh8pK0A52+patZ5hk4JZ4
         bP/g==
X-Gm-Message-State: AOJu0YwcBKLK+CgoM49dzq8ztO9VbEzSJXX4ZcfVGWih9EHw1ylYRx1u
	AzK2xT3Bybq5fxEYtCD8DTtCKDtT6yQ/Q2cmwlqOHToU86D3k8K80IZ4
X-Gm-Gg: ATEYQzxUoavNSmUx4PJjxKD0/4rQorh3IenV4GFbN1hgWq49r+7LJAI07KYGrgA+JKe
	+D0GzGfA1QlrGO1G/KaQETsIuvN48bEXJxzKK4uV8ogfMuP9B3KfbhM5HP6I6BljuhC/SfmXiBA
	qulyhs2XTmU65CZDxdFI4CWXDOL1+S/Ve6Zthq3iGqQrexH+02DPhSDUuZ/7x0KSd8dPL9oiUX3
	va+Xc8LSWFHEWR9dSPmH7YWlEppDHY9C8BQdIfgLfq/+oKaatnptfTWtlNo2wFm/L3rM/KDKThn
	Ktmv62ujdEFbbvfAyojbfWZuPECyqXRzOLux187BtT6w99izuXeDbfCQkM2jt3hoi0pm2QvKNtQ
	3+4tyshWVO5D0bcSDO73gWWUeubgrixKVAkVU1suP81tn+iDFE1WFhfEFrCxCC1dCCDpD9sSWjK
	2YTqzpgGw/o0+CDuZyNIt327tCmPP+/HoYIFFN
X-Received: by 2002:a05:7022:ff46:b0:119:e569:f27f with SMTP id a92af1059eb24-12a726dadb3mr3934467c88.40.1774140516676;
        Sat, 21 Mar 2026 17:48:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12a7330d1c5sm6040920c88.0.2026.03.21.17.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Mar 2026 17:48:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 21 Mar 2026 17:48:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>
Subject: Re: [PATCH v6 3/3] hwmon: (pmbus/max31785) check for partial
 i2c_transfer in read_long_data
Message-ID: <cbc75e51-4bef-465e-95c9-68e0d534e3db@roeck-us.net>
References: <20260321181052.27129-1-sanman.pradhan@hpe.com>
 <20260321181052.27129-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260321181052.27129-4-sanman.pradhan@hpe.com>

On Sat, Mar 21, 2026 at 06:12:05PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> i2c_transfer() returns the number of messages successfully
> transferred, not only a negative errno on failure. When called with
> two messages (write command byte followed by a read of the 4-byte
> response), a return value of 1 means the command write succeeded but
> the read did not complete. In that case, rspbuf remains uninitialized
> and must not be interpreted as valid data.
> 
> Treat any return value other than ARRAY_SIZE(msg) as an error, and
> return -EIO for partial completion. Also return 0 on success instead
> of the message count, since the caller only needs to distinguish
> success from failure.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
