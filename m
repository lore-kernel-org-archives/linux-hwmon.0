Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=178.32.127.22
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795771484;
	b=nogxjhENzwzd+cAGRzF03nrlJVZhp0/+sGfgOqJVKtjn6Vl8Jwc1wFdkU5E96kh9SLmt
	 2tG5Ql3DPPYY0Yk0xFB7C1RXwVteP0QZQDgTKghgGyiOBFO9xawoBDD79y6TfJnZLc/6W
	 ZZP7QMHek/FfvtCWVp+IfW3o1qVygG3qR/jVauPF+zMXFR5HaTZFzro+abMCB9U0Oyatv
	 OAwcittMtG/Wd57Zb6ur5nHDYn74aG5hLu+WT/cO8wjiRLzii5/4lYR3tVGZjtWupyJxf
	 iyL4bG+x25WIU67IT8CiP3u95Oq2G8QX55tiUYDeJGNOpRP4AoO8T+i7RkT+xkrekJw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795771484;
	h=DMARC-Filter:Received:Received:Received:X-OVh-ClientIp:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:x-ovh-tracer-id:X-VR-SPAMSTATE:
	 X-VR-SPAMSCORE:X-VR-SPAMCAUSE:DKIM-Signature;
	bh=O/40p9mPUJ9lzAMAARPW6FZcfYSAz2NfyvuBdIj3BtM=;
	b=DqYCgUFWx7vIY/reNbUhhv3FDrsBhS7kEU7pyxjo0b0Q7MFIdXEF/WFL+hCwFiVbF253
	 8BcPqTXanR2/BWCeBLllYYiB6u9EPUx3sNl8j4EhE3NUT2XJcS4GIHgKk70JjjjZrGckd
	 /b2VFP1+zz04EfMP2wbw9eC5sbmjb56eTFuTl6dFNHWc3Vz5rX8mC+d2r2GdrCcYH2Kkl
	 NbPAVFFhvzxjuPuC51PeBLoHHR5YIto1ShxiooZunaijZxkEI4GLvvXVHCly3N07n66/Z
	 oXLCz7+YkGQTCoEQtVRgl+upAFXNEw9uwQ1HZihLavEMuL+9H0Tb8glCaqRNnpXwcHw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=3mdeb.com;
	spf=pass smtp.mailfrom=3mdeb.com;
	dkim=pass header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=esW6lGKo;
	arc=none smtp.remote-ip=178.32.127.22
Received: from 1.mo550.mail-out.ovh.net (1.mo550.mail-out.ovh.net [178.32.127.22])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8B1606A31E
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 09:24:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D8B1606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=3mdeb.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=3mdeb.com header.i=@3mdeb.com header.a=rsa-sha256 header.s=ovhmo3617313-selector1 header.b=esW6lGKo
Received: from director3.ghost.mail-out.ovh.net (unknown [10.110.37.191])
	by mo550.mail-out.ovh.net (Postfix) with ESMTP id 4jbSfq63kfz62cK
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 09:24:35 +0000 (UTC)
Received: from ghost-submission-7ccd8bbbb6-fkvks (unknown [10.108.42.118])
	by director3.ghost.mail-out.ovh.net (Postfix) with ESMTPS id 8B524C0148;
	Fri, 27 Nov 2026 09:24:34 +0000 (UTC)
Received: from 3mdeb.com ([37.59.142.110])
	by ghost-submission-7ccd8bbbb6-fkvks with ESMTPSA
	id BUE8FlJMCWvH9xQAMqfShQ
	(envelope-from <michal.kopec@3mdeb.com>); Fri, 27 Nov 2026 09:24:34 +0000
Authentication-Results:garm.ovh; auth=pass (GARM-110S00442b59f09-659f-4e85-8f3e-1b21a2cb2032,
                    D697370656FF9958A21AC54DA46BA3848F1D2CE7) smtp.auth=michal.kopec@3mdeb.com
X-OVh-ClientIp:213.192.77.249
From: =?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
To: =?UTF-8?q?Filip=20Go=C5=82a=C5=9B?= <filip.golas@3mdeb.com>
Cc: Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Micha=C5=82=20Kope=C4=87?= <michal.kopec@3mdeb.com>
Subject: Re: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Date: Fri, 27 Nov 2026 10:23:54 +0100
Message-ID: <20261127092354.2974097-1-michal.kopec@3mdeb.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
x-ovh-tracer-id: 5499739571757031070
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: dmFkZTGs+RnU3C3OsENUliFAc1h3mKf8kyL6qkRqhxTtUD5XtN9qxQtuDxQiujbTuBNV6RQsu4ZRDrLB6HC4FCcc7tsMHu2OIAI1Kmx9Z0AHJqDnUK8++nQQ+dmKGc4HIgqnL772fqjMG1NyRjEoRoNVvq0xRqJkDiJCQclKM14FvX9A5fUNujM3qx+KfK4S4rfLrgJ6dIpYdG8cA3mrkZesRUMxb0ggeiUED499hDYcFU90y9aFchmcD7iv3sZlouLq5tSdQVCccAr4Ocz28O1bPogfKuoGicdRCilSopCDoIAOTqOWQFbIJs2JK2QLbxmsWq5S8tgLkHPdLdbIz7Q668iqXAw33kNXxXu5PSG+T53kBkb9V7g796/ZWIrUAsmbleuNtFobamGfe9Khsn98Fmc7c+qNI158kN/BMCg+b6tLUIdWOX/6j1v2bV0coVj8cLdf2nyIqz2wPoJguw/vYH21WnlI187IaHf2Ipnuzn0EKDwLNMSH1QgsHXu6xVtv8pZLKKzzVphPQFeYvgp7vjUg+4qoMupbYf5gs5fmtBX1y3O6zKPDirwQ28uSZdHQesgP25oxJAZquUw7x/Bc8tp0DRgIBadzZ7xEJsjxaNtqxbGo6lG5Y+VJOjH6fYHTJV0mhP0xkbuKvbA1u+r84CCED0rIYQ9gjYNEc3rmv5TTPQ
DKIM-Signature: a=rsa-sha256; bh=O/40p9mPUJ9lzAMAARPW6FZcfYSAz2NfyvuBdIj3BtM=;
 c=relaxed/relaxed; d=3mdeb.com; h=From; s=ovhmo3617313-selector1;
 t=1795771475; v=1;
 b=esW6lGKoFzk7ZX1j98FQevJ9M0+jgPnC16FBKdE6gplJzE57KcA8Yk2FMIcLy3kYe3WiJQwB
 XDaSy+v8XwXasbhSA+LhnIMv+WMOZfbdxej67uAQuDiCHsn+PclsW78FD3TfcQvGUj/kT66ayY+
 6ZL9xDl4i/jtWTdeqlqp/1AgoT5XPs/7gcj55vouaab7pGEKDJ9iX4giUEILOFvrGiV8UZUrwa/
 yQXd80zqGjOph+iCLyoyorAwxlCE/3orHQUDH4JjFo7B0d8hpusFGQ02pA3hSk3Nqzo5u28ZRbJ
 5qNd3QbfGakxuJNhrcvi65PcZyYVfi672oqaJbEdSAxWQ==

On Fri, Nov 27, 2026 at 09:49:07AM +0100, Filip Gołaś wrote:
> Add the capability to directly control fan PWM and configure the fan
> curves. The initial version of the driver only supported monitoring
> the fans.

For the series:

Reviewed-by: Michał Kopeć <michal.kopec@3mdeb.com>
