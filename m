Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0366F19ABAA
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Aug 2024 12:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725021053; cv=none; b=MTd97iKc0ZV8tcSSHEjYowIzk/J/TA258zsWVVvANU5pZ3RAEwE4aTGm9oAd/mWIO6K7QRSdL1YM6j2FO41pxlFrGBzo5kkpeNgUrJ0GQ0DSUkTATn9tizhAhB+y0Guf1Xrs28LqKT+M+RI5CgoVTomnfXEsAC5ViDF9tLmmyBc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725021053; c=relaxed/simple;
	bh=vm8nbbagroGWfGnI0JakAV0vmMg+HF9boHYOYYSDmTk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rvvd2sYmq4Fyw9Rjn2OaVY+uRJYw1K/0SgQLh9317onJBtF3uM/LFvdxBAuby7x5NiQbyNUZCg3Mow4T++jvSolmCUqrvaFl67p0LmyklgtrBCQrWhgBoZOwdGUCrIFZ58odZ3qneofLtDioiO52MpUMjo4TFoblcNnUJWwLxhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RAHRUzNp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RAHRUzNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF1EAC4CEC2;
	Fri, 30 Aug 2024 12:30:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725021052;
	bh=vm8nbbagroGWfGnI0JakAV0vmMg+HF9boHYOYYSDmTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RAHRUzNpgCCJN0Qi0nW89xVI1Uw6F1/kG7D34YE98QmOzKpG3p87mTfhWZzgX7jKt
	 AgUUv96BdHiGnDyW99kw3NVXWDJl6kwraBtO1J4YeVOa88dsrM8bmjWfNABnhSxwju
	 RV2zgnaKPGQ0SZX3huK6BfktQe/VOeJ36Vqws7RkOKIYu4owDSJWUfW6ybRpJUNJ5e
	 7KQSleiTutWfJNkY1e+cBNBpUcneiq3QjuNxwAwIa/ctPkEHrcF3ea0pqMck/9vcjn
	 1uGByAMZNajFvScAzIeiP4OU1eUgnoal6vEZa9q+xVMtZzggF1haRfq4GCeY22tjAt
	 mNm+4EU1j53Mg==
Date: Fri, 30 Aug 2024 20:30:49 +0800
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH v2 14/14] hwmon: (ina2xx) Use shunt voltage to calculate
 current
Message-ID: <ZtG7eZKMK2KlJKtj@tzungbi-laptop>
References: <20240830010554.1462861-1-linux@roeck-us.net>
 <20240830010554.1462861-15-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830010554.1462861-15-linux@roeck-us.net>

On Thu, Aug 29, 2024 at 06:05:54PM -0700, Guenter Roeck wrote:
> Since the shunt voltage and the current register report the same values
> when the chip is calibrated, we can calculate the current directly
> from the shunt voltage without relying on chip calibration.
> 
> With this change, the current register is no longer accessed. Its
> register address is only used to indicate if reading or writing
> current or shunt voltage is desired when accessing registers.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
