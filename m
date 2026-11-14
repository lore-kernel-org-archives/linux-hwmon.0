Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.6
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794627065;
	b=ewMf3dax1AOodjAY7QPB88dWiUmnHgHLBOzxMM2oyyMnb+f3FBu5kPIfWq2hkG1/RJhe
	 EMVcQdWr2RiUBgZJv0DKcvSWrIQw6k+6dLTUqODHLabMh03BvG/1Z6zLzZOAFQeUSRV1T
	 8P0Y5Tta7Vcr36+9MDxI5aaHfMuoKXEJKSmXo61IwsXZBVPu2bDkh5py9KT65DVUlNPuT
	 uCNHszJB5fOg1IhwLuGXO6SMrUXAzi6ix9BamohU84KCtCGREGu9xK2lNnDAjiJ36K6eh
	 fS22RV2MrGg84Z4w6s3Ap4yVe9bTojgU0AKAwr3KD6rcKxoKQTY8sV8MiE2SShnIslw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794627065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Developer-Signature:X-Developer-Key;
	bh=Sf2O7kkceInXjyxfN0wCfCoTnaw1EJRsKC8iLpu8ZEo=;
	b=AowgYlfURGTrUbAQ8nq6+u16UYBhgMQUpKdv3DmUGmqUW+RI0QFQ/UfFuJjyjRiTIwGS
	 pnR0jlbQb9Rr5JZpFhJxbGT1PcOa8C+5UtplKnlLNOW12tLIyPhVVER/x/3Q0HQh+UF43
	 xR3reoNboDSsvxKWWjyku3aqxVzDR/uCcye1DoNsMGdeiwK/ql9tk56Btf5szXMw6giYf
	 otJeduKkrtXyZD1y0oxxN//KhgkF/8dHWP0rZ4rHJOtj/JZBBIrZa+/STEFBV9DUHtMex
	 ye9h0oXKLfsTCAPrh1BunQuFn7Pb4fCq0rA/w6W78OzQnHToBYmzmtInC8MllKHELDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EuLy3oOe;
	arc=none smtp.remote-ip=74.125.229.6
Received: from mail-dy2-f6.google.com (mail-dy2-f6.google.com [74.125.229.6])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92BF2606A884
	for <linux-hwmon@vger.kernel.org>; Sat, 14 Nov 2026 03:31:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92BF2606A884
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=EuLy3oOe
Received: by mail-dy2-f6.google.com with SMTP id 5a478bee46e88-33e48934fa8so360440eec.0
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 19:31:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794627060; x=1795231860; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Sf2O7kkceInXjyxfN0wCfCoTnaw1EJRsKC8iLpu8ZEo=;
        b=EuLy3oOe7SL5TM27qiH3eRuDTM4sSdUbbDclLxl09yqcGRd9LM7EpcLWvfpoeVV3Kr
         H4NYoWdeHZTYducYu4coUmb1wcLsfSKVIFRFG7vBfPgVzflWQCGPSLYkRzK5aK9HkOWj
         YyCR/wx3j6yeg8RNeORqS+NaDsx0usDPOU3HUrtOUxj+RhLe5X8Gg/wYxl9MDM8smiIr
         TphlUJhg/+oi13tGwRdmTexN3cCAZrfgBULMpFIlKtHebG5uJSSq1AgPNxvUmjT4So+4
         ctSyEgFLpka5nMvYKs8fZzC/D8AHMrNKgEBnX7eMBcJLtAmMlnziisoF1mXgPpDpEe4n
         CACg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794627060; x=1795231860;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Sf2O7kkceInXjyxfN0wCfCoTnaw1EJRsKC8iLpu8ZEo=;
        b=erT79eaustEEOU/cq/kS5AQ5LzWcwBIRuTbJ0W5REotIC67pgjRu6dPiksA46vy5lE
         l/oEcMbAyE87BloBIHC07Ms/b4qJqZCqFSnhy+ovVCAwBcSnhKtr4tu7BE/VAG/2FkDv
         RqDnpohycP5VS1eKFUVugVBeU8ZiZM8zuYjORu+gJeZeYyGwJGpQFssZe9JnSHgwaMAJ
         9FDcGFlPd5ZQsgvrRB3ikGRe83JOp5Wuo6Uy8h2dKppMldLCTUUmL1nuT3ReU0mDsM1Y
         DLl7TmjyA6sMEgX1gQKBooeVWP2ImlBD0XynQoPREcHerwc8QOl5xW6l7UO/AiFivh0g
         peYw==
X-Forwarded-Encrypted: i=1; AL+hErEGiHamjYthgOwWNbh1MX9WrHJwcXWlTgAXKuqshdd8gi83eMwm0AaB455qszxdi260CurybWrbG2SnTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9CqMEfJJQDv59un5a+c0IaX80F6gy3vt6K3D2ijuMCknKJMY8g
	E+IGDbxOjNeiOeqSYHQo6c2G6ERWUm/Xkeuno6iBhd3MoAcBW0HTtnO7
X-Gm-Gg: AYBFou1ibTSvW8JpqdfFN0sFK34bPhP9B7i24mUPXI14Xcnh6aydPrZTOO/eorQ9uHa
	KIZLyrOPZ1cRJvk7gy8WwOu2DOzApHuM+YczxqTGD8wWC6gbQCFFRs1bxSdEZlJyW+O6ATuV7of
	EkX3BTwd6qrf0dfxibzum/XMNPy/aojwQZ/e+c86JmdV3qXz0pfbOZGXZWLn/xmH3y+qNyImMQb
	FHAu902gMTZ7bnB7W1v9ptfSZN7FNz1N0cCol9vu6FWNwTYRwAWO8pNZX7xz9bVGrWe2OahDm3v
	7wggDP1DsmwvBEQ2qI+GPNf5Jk5ijMsvXNjRGPraQ25gDc6lX8hEr2OzZq5Jj6EYLXutlxLtKTS
	dG1jOunpDYQA+mAQyCWkPtlryTJp7MpINhzvXPPMrLL7CV4NClii0ZSuUtlBF9Ey9qUXm5zzZ7m
	85B/3HMDSwtGroGKxuLfqC/B+PpBW9NDdAmTAXW5m55RjBUKX3qckoYKXo+k51ZsHllnk05O8q1
	MDz8r+ewo6wFn/griIbFBKYcbT0UWanheuk6iIJBDopfeftR1JgpuFy1nRf9S59u/N1V5zTfWX9
	OoaRU0nmjGNvWiICl1ucV0mo8n8pWBGdRSA=
X-Received: by 2002:a05:693c:4152:10b0:36a:4a68:84e5 with SMTP id 5a478bee46e88-379659c6839mr4321817eec.8.1794627059312;
        Fri, 13 Nov 2026 19:30:59 -0800 (PST)
Received: from [10.54.241.192] ([108.241.87.190])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955332a77sm10864283eec.4.2026.11.13.19.30.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 19:30:59 -0800 (PST)
From: Ziqiang Xia <xiazq123666@gmail.com>
To: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hansg@kernel.org>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Guenter Roeck <linux@roeck-us.net>, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH RFC 0/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Date: Fri, 13 Nov 2026 19:30:54 -0800
Message-Id: <20261113-emdoor-intel-wmi-rfc-reply1-5d510eff323f@gmail.com>
In-Reply-To: <739e089d-fab1-4ade-9373-fe4c5b3924ad@gmx.de>
References: <20261113-emdoor-intel-wmi-rfc-v1-0-d77ecf23693b@gmail.com>
 <739e089d-fab1-4ade-9373-fe4c5b3924ad@gmx.de>
X-Mailer: b4 0.16.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794627056; l=4109;
 i=xiazq123666@gmail.com; s=20261113; h=from:subject:message-id;
 bh=Ep7apa0xtzYtZjgZiLOq+ddP8sE5laBmFrfwZawgZDk=;
 b=s6CyG4cIYK9pm1Ez44ffORRcwEZm4xv355+QGE44wN/Ik7bksui+l3UHnXKRkrs3+1sKNn9jE
 VLD2t4EVWujC0zXDRajTHOsN2DTrHEwoOwmnCFIAwaJQ2U7Rq9iUdtc
X-Developer-Key: i=xiazq123666@gmail.com; a=ed25519;
 pk=mrJQOUoyemvqamFAwqXZF59Z8eZnI11ZI+BEtDNxq7Q=

Hi Armin,

Thank you for taking a look at this!

On Fri, Nov 13, 2026 at 09:37:44PM +0100, Armin Wolf wrote:
> Interesting.
> 
> IMHO using direct EC addresses will eventually turn into a
> maintainability nightmare. I am aware of the issue with CreateField(),
> AFAIK you can workaround this issue by simply submitting an oversized
> buffer to wmidev_invoke_method().
> 
> Can you share the output of acpidump please?
> 
> Thanks,
> Armin Wolf

1. CreateField() bug in legacy WMAA-WMCB methods
------------------------------------------------
On this DSDT (all 13 legacy methods WMAA through WMCB under \_SB.EWMI),
the out-of-bounds CreateField() is not applied to the input buffer
(Arg2). Instead, the AML allocates a hardcoded 8-byte local return
buffer (Local0) and defines fields past bit 63 on Local0 itself, e.g.
in WMAA:

    Local0 = Buffer (0x08){}
    CreateWordField (Local0, Zero, RTNC)
    CreateWordField (Local0, 0x02, ALID)
    CreateField (Local0, 0x20, 0x3F, RES3)

Because bit offset 0x20 (32) + length 0x3f (63) = 95 bits exceeds the
64-bit Local0 buffer allocated inside the method, passing a larger
input buffer to wmidev_invoke_method() does not enlarge Local0 and
ACPICA still aborts with AE_AML_BUFFER_LIMIT before entering the switch.
Fortunately WMCD, WMCC, and _WED(0xD0) do not have this bug.

2. Eliminating direct EC addresses (ec_read()) in v2
----------------------------------------------------
I agree completely regarding maintainability. RFC v1 has zero ec_write()
calls and uses ec_read() in three places:

- Temperatures (temp_regs {0x70, 0x73, 0x72, 0x62}, i.e. TSR1..TSR4):
  Checking SSDT5 (\_SB.IETM) and /sys/class/thermal on this machine,
  TSR2 (0x73), TSR3 (0x72), and TSR4 (0x62) are already exposed via
  standard ACPI DPTF thermal zones (SEN2, SEN3, and SEN4 under
  int3403_thermal), and CPU temperature (TSR1 / 0x70) is already covered
  by coretemp / x86_pkg_temp / DPTF TCPU. Meanwhile both fan tachometers
  (fan1_input, fan2_input) come purely from WMCD GFNS (0x02/0x01) with
  no direct EC access. I will drop temp_regs completely in v2 so hwmon
  is 100% pure WMI for the two fans.

- auto_power_on (0xf5 / H_EC.ATPU):
  WMCC (C75665A3-4382-4646-ADC8-C81AE146E455) only implements the setter
  (Arg1 == 1, Arg2 == 0/1 writing 0x00/0xA0 to ATPU) and has no WMI
  getter.

- win_lock / fn_lock (0x5d / H_EC.EC5D):
  WMCD GWLS (0x03/0x01) and GFLS (0x03/0x03) write ZZTT=0xD0 and
  TIZZ=0xD3/0xD2, wait only Sleep(0x14) (20 ms), and read EC5D before the
  EC finishes populating the shared mailbox. Calling the same WMI method
  twice under a mutex with 25-100 ms delays (550 reads per step) reduced
  win_lock -EIO errors from 26/550 to 1/550, but fn_lock still returned
  occasional stale values because the second WMI call immediately
  rewrites ZZTT/TIZZ before the settled EC5D byte is read (and _QF6/_QF9
  hotkeys also overwrite EC5D).

Note that platform_profile (GPFM/SPFM), dual-fan hwmon (GFNS),
touchpad_enabled (GTPS/STPS), and the 0xD0 WMI hotkeys all work 100%
via pure WMI without any ec_read() or per-BIOS register offsets.

For v2, would you prefer dropping all direct ec_read() calls completely
so the driver is strictly pure WMI (dropping temp_regs, auto_power_on,
and fn_lock/win_lock unless a reliable pure-WMI path works), or keeping
DMI-gated EC5D readback only for fn_lock/win_lock?

3. acpidump output
------------------
The sanitized ACPI tables (DSDT and SSDT1..SSDT28, Windows licensing
table omitted) and decoded ewmi.mof are uploaded here:

  https://gist.github.com/winddd666/8f739d1cab5beb503f606093ade10d65

Direct raw URLs:
  acpidump.txt:
    https://gist.githubusercontent.com/winddd666/8f739d1cab5beb503f606093ade10d65/raw/15e1f0d4c98096674f9a958e431096b1b49d1a40/acpidump.txt
  ewmi.mof:
    https://gist.githubusercontent.com/winddd666/8f739d1cab5beb503f606093ade10d65/raw/8eff35b93fee7ed6e2d8aab47fd1ad4137bb13cd/ewmi.mof

Individual tables can be extracted with "acpixtract -a acpidump.txt".

Best regards,
Ziqiang Xia

