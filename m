Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2E12B2D7
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 18:39:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785782356; cv=none; b=fHMTo7PaXEW4sCTrgGbeBabaXLc9Q+f5GKUbAJQfpOiUOHK5hQmF/IK+vE4HJUemI6vUiQnyul0RQcMrhn1fqK5tgu0qOM5glbrnVAbtyJFyryfOkkrad3pxQgUwby5ZjY9h7++N945kkTaGKSEm7eAI3dgdTkK76KW2d5DjJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785782356; c=relaxed/simple;
	bh=zWmeBlkJq3G8sJw2tROHL8Ws+eyqgz9z5MHp7kB3RM8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BtadKUrsWR4G/9VQ0aRiieE25Ak4sLOA93LF4THzwDF4kMDL47sf8d6bDnZuItDyybUlvIlSP5vC5TIDfsk5wyX+g3Onvuq4aFkQO4n5lHI4p9UgVPijSkjg2r02qZzrqf7/n5oC/wYiHSxhb2FxP99CcCIZNJZF79PH2yfVF0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H5rgwadQ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H5rgwadQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4ED7D1F000E9;
	Mon,  3 Aug 2026 18:39:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785782355;
	bh=BC+fmMnYvUBiq2AR24NH0MX29WnPXc1QzB3FI/JmiL8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=H5rgwadQbFbizVYTrCkrr3xIL3pEJGbpzc7O7UhhhWFuaOr1Py19PmkQg0cNXn+bk
	 EkVTZwzaRx5EamPbS5VnYSOQVt1DgNsieyte0QSXN6u0frZymaDzgHi6FaqWxc72Ly
	 bc6Nxm73+zL9XmaOfQdUI2U/uUM29tbN7VmX7rnnESgl0kt5+BoWKyxkVcWmPpBv4F
	 ZGobRsMshCB/FcMAiHF0fvgboMMGb90KGO/LwSv6T3c9VtUmJpTASfkzTqX9rMpDgq
	 ngHi6hWGybF24N7W35pC/iMIwN9j+XGQLKlse2Q5/x2Ld70oHs5v8kStcbgsI5olt3
	 BZD/CAZq1Zgzg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] thermal: hwmon: Remove hwmon class device along with
 its parent
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <23195575.EfDdHjke4D@rafael.j.wysocki>
References: <23195575.EfDdHjke4D@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 03 Aug 2026 18:39:14 +0000
Message-Id: <20260803183915.4ED7D1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] In the error handling path of `thermal_add_hwmon_sysfs()`, an exis=
ting shared `hwmon` device is unconditionally freed if subsequent sysfs att=
ribute creations fail, leading to a use-after-free and list corruption.
--

--- Patch [1]: [PATCH v1] thermal: hwmon: Remove hwmon class device along w=
ith its parent ---
commit b487e50bcd7169eacc3dd2a937306e759abd531d
Author: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

thermal: hwmon: Remove hwmon class device along with its parent

This commit modifies thermal_remove_hwmon_sysfs() to remove the entire
hwmon class device interface for a thermal zone type when the device
holding it is removed. It also serializes the addition and removal of
hwmon sysfs interfaces under the thermal_hwmon_list_lock.

Link: https://lore.kernel.org/linux-pm/20260402021828.16556-1-liujia6264@gm=
ail.com/

> diff --git a/drivers/thermal/thermal_hwmon.c b/drivers/thermal/thermal_hw=
mon.c
> index 597c33c8a5550..2233ceef7f140 100644
> --- a/drivers/thermal/thermal_hwmon.c
> +++ b/drivers/thermal/thermal_hwmon.c
[ ... ]
> @@ -196,23 +178,23 @@ int thermal_add_hwmon_sysfs(struct thermal_zone_dev=
ice *tz)
[ ... ]
> - unregister_input:
> +unregister_input:
>  	device_remove_file(hwmon->device, &temp->temp_input.attr);
> - free_temp_mem:
> +free_temp_mem:
>  	kfree(temp);
> - unregister_name:
> +unregister_name:
>  	if (new_hwmon_device)
>  		hwmon_device_unregister(hwmon->device);
> - free_mem:
> +free_mem:
>  	kfree(hwmon);

[Severity: High]
This is a pre-existing issue, but if new_hwmon_device is 0 (meaning hwmon
was retrieved from the list and is still active), does falling through to
free_mem unconditionally free the shared hwmon device?

If memory allocation for temp fails, or if device_create_file() fails, the
error path jumps to these labels. Because kfree(hwmon) is outside the
new_hwmon_device check, it seems like this would lead to a use-after-free
and corrupt the thermal_hwmon_list. Should kfree(hwmon) also be guarded by
new_hwmon_device?

> +unlock:
> +	mutex_unlock(&thermal_hwmon_list_lock);
> =20
>  	return result;
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/23195575.EfDdHjke4D=
@rafael.j.wysocki?part=3D1
