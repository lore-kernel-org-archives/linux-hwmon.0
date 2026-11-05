Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793882575;
	b=U60wKUEGIwcg//FraHFJl7dFPNxNTWzvVswSnzsps9kqqWiGFKdwdTH331pI1JaOWjRh
	 1/W0HiADv0Y3xRvDyoThHwNSqqd6hM5mjjTRg2SrVAHeMEvP11R11eY3WUw6EbIN5FZU/
	 uNaPFJDUsJMf/C8eej5tUEDv7v3bhHN/lAWlNyWY5N03B3tjQVNImaFqtmLKDTcCIPYzp
	 RJUiZG0YYV0TZPqsX/xse8WqH+mtEnvRyGQuxi3zQH3+xRrkD5Zmqu5w8xWUF9ASQimGO
	 YTon0cq+0OJhhgI8ICjcqhJlwGukxDzS/s4yHOmxxTBkfBsheyZERzNjy0wvjeUhSTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793882575;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=1Ne75eyG2UyJXHCI/3L+TP/oCHE9qyAF9KYGixpkjUI=;
	b=PtNhGjBGqXr51wTnBS27ojw+nb24vsWl9chzzAW2A5G4yIN5qe479yGNMa6S2eN4awTD
	 gxbHidYki1YGLBtBbVo9YD1iBM/GNpzX0GRbIapMjQzFOhTPjZ0sBwrplMVTogkLNPB0j
	 2qj+07To4BXJwRffXg60zT1rmqIerXF7/pq39FTW2hLIvft5lgdFSz0JZTUeABsmX7hES
	 8auziz8e7K4WChZRJzY5BCqqypmxcTU2/fwRPLV85QkoGejy+hOst1dTPJSD0Kv6sFvF+
	 MRqmIrtFrlFql4a0gajCdzx1gJT0WiYQALVLvArhAWSmNySNBW5dpXLOo9nU2JvmXzQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="Iq/RsRJ4";
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79805606EE8D
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 12:42:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79805606EE8D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=Iq/RsRJ4
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso14324385e9.0
        for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 04:42:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793882573; x=1794487373; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1Ne75eyG2UyJXHCI/3L+TP/oCHE9qyAF9KYGixpkjUI=;
        b=Iq/RsRJ4FsBgNrS+n61bnnkncfY3sB1utDJz4yKMa8JmxtntKvltA7XUnIUJlt0kpA
         QMFuu+8SAgTWPRaT7UvfwS5VivCUqcB/2qfMqThFc4z3B1I6eERj7as7Ylf1yWfyTzNI
         S1ZKyvYz1AZhQFycQHFAtuireiThe7zLVuv/N51Csjb9LggQWMvcxAt8KnICGFYTQnfz
         pDzUixOyPM9CSnPzxdbbvnG06wwxondl8WwHBFBrhyKgaIa7qyRxyOEG5J6MXx7548jK
         uXuijpg/ZS0Y+yQPXD5R5cgaoyvTnkBblpitcCRcBrJ0GcZVY4tWysEYijBtCxFVcXok
         h36g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793882573; x=1794487373;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1Ne75eyG2UyJXHCI/3L+TP/oCHE9qyAF9KYGixpkjUI=;
        b=mQ1cbF5QWSupkRzQDw66gvI49oXRvdE7SAZkXDVJP9vcBOiJQiiiQSmwcs8fEUHni9
         WODkaDtVi47UISbWQQn7o0Vj33jvXnnD3YFTwQkaqkxBmYKor0nVCs0zzk2SKVAIoJAl
         b1utSp2Fb7nliGtlr3PPtZi6RTt4oYLcxBqriFo+S7D7p/oXrbsa/Wfxr02kvxuWOZEu
         v0zr83q8zoK9JHVDqxYQDbD+SKrxiYHCqCVUXGxwlG22NT+7u/fAUln32a6EemmCnTII
         4CnhFP5DgHg+Zq2WeD3oScq/8E4xdDMV696u4f/QjFzDAlbJv2BPLoGYGBZMeJ4UiVh5
         +6GQ==
X-Forwarded-Encrypted: i=1; AKwUvBwK1JjYrBRtE1m768J6jm6cm2mrY+7XxZdrszWMrQ4Huf0+T74bw5aNdZVNmjdJ5FXdNfGNtjUO2nthbg==@vger.kernel.org
X-Gm-Message-State: APuU4Z92FsKgAvMSc0NKAz4/KDryDTv0q9U7+P2Rwd/md5kHYay2XvjK
	oYS8kLQd3qN57fgL9WiWeeUja+bjwiuv4rVEO0Pe5svaDLwrkZHAktNSas6I3MyFsq2LtuvswZE
	7Ao4j
X-Gm-Gg: AYBFou1QdzCtgAGgznf6twdYdLnUju5JIzElwf4DAWYJi+hQFibZTFylNlA14REI+2P
	JHBFu7gqFCI2lZNt5xmb+eyql5eVrZ2X6O/ki1o4m/4zhN4rNSMK3ssMwanPDNYTlQEoLw2rnyk
	KNxsHoyltwU4rgAnMGNZsDRMXtXlpa9u1Zl9BlB+dy9VvFjnjCNAgqQcU+pOCjbaQ938rHW0KRs
	nOp6IYZdNoSJzxYumqUknFGCn0OvcoQnde0rl5NBdeCvMU8O0/hL6TxG1UCjmci/ELqc6vyYG3y
	CHevyGx0HTt1DqhxMn0WCw/KhE8hENNoBZFWjWVCUEgzX/ZKDLsBiXtRWSLxWFKRQ6qSAPol+3k
	41OTgu6fO7z+o9Ne7PmPumO53iyKPQwA0gMZDb7eix4wNCL4USwqkPY9ZxbEFBOFZNula1Gx7r8
	t0G5juEtWKBcC1lZO1+H2LtsspATfhpsRRx0NySEU8BGCGIoPhwRDUDtdFwCJN2zgvfkUEnYZqE
	CDBW4ywsB8U/F30IK04c3F/hj2+uJLKrca4Ma8aNNlECG0qDC1tSCp/iSuXjNeDQSRD/+u1G7il
	Ez4ZaGVI5Z02ukmrODUms8AG6RLghYZ4+5LO2P/RlKI4
X-Received: by 2002:a05:600c:3b88:b0:4a1:cf60:dcc3 with SMTP id 5b1f17b1804b1-4ac187a6ffcmr448518465e9.29.1793882572597;
        Thu, 05 Nov 2026 04:42:52 -0800 (PST)
Received: from arrakeen-2.home ([2a01:e0a:106d:1080:8261:5fff:fe11:bdda])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b57373f7f1sm73487895e9.15.2026.11.05.04.42.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:42:52 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v6 0/3] iio: adc: add support for the MAX34417 Four-Channel
 High Dynamic Range Power Accumulator
Date: Thu, 05 Nov 2026 13:42:45 +0100
Message-Id: <20261105-topic-sm8x50-iio-max34417-adc-v6-0-63b4e8279633@linaro.org>
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
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMZ57GoC/43PQW7DIBAF0KtErEs1DODYXfUeVRYYhoSqMRG4l
 qPIdy+kUhvVC3f5pa/3Z24sUwqU2cvuxhJNIYc4lNA87Zg9meFIPLiSGQI20KHkY7wEy/O5nTX
 wECI/m1kqJfbcOMsROmpb0FL6nhXjksiH+e6/Hb5z/uzfyY4VrY1TyGNM1/sBk6i9/25NggNXw
 qneiN5bJV4/wmBSfI7pyOrYhI+c2uKwcJ2B0qU9em1XnPzhBIjN62ThnGxAGVIGsVtx6oHDdot
 TlSuvGi+JOpArTv9yxdvidOHAe6NJe3R/nl2W5QvEWufUGQIAAA==
X-Change-ID: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 Neil Armstrong <neil.armstrong@linaro.org>, linux@analog.com, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Marius Cristea <marius.cristea@microchip.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7272;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=LlEAGHxTmhCT5Msd7aVO4EmAR3EMf33/+99ZdmDLrbY=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBq7HnKlfP9xl0hE98PNnbXKlRlkcWKbuLo0lWcBbXi
 NLXyT22JAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCaux5ygAKCRB33NvayMhJ0RtpD/
 46dOeyJve/cyfLReO5da4Z4mHdX6/zl6GdHvnxYLnKOcMe8bDYcgwakiF5wrc0hqPVLBCM3dnRv11U
 VaMlrBuFauKiq7JKfSKTrtPQWmITBDLvLr7MH7Gb/tWGH4NxvSUIFU2dmDXDOP218CXkso3aYjJYvO
 MFrT0b5a0dks2qZp1yOrp+N68D2YwOF044pdGf8c1VHzBq8gu7Q659gIeO3r7rGWVyDOMvn52J9KWh
 p+JQ8INYVj4vMGSXH8MPo2ZBgeTq5CbLmUrATwilnXe7O3ru5aycdqHMwn6U7dGhFuzQxxRgKg1k2Z
 ghpr8rUxugKlwtaJaPdDl3QDvDnFJxhFPVT2qhmrIyfbszTDLeWfV7M2pP2Twic3pit4Y3UylM71YF
 q7mUZDyuGNXOZ4JGewO59J39B2y//73x3RmsTmtW1gCZtMcx6s37htMrW5SJEuZLTN0w7FHBikeS8k
 MnTdvaP2VA2Yquo9AXaJZ4hapSu5T6O3aBnY0c2T/mSyse5jl7AAusQ/XoGlYxySAcLrv4D9odlWQi
 dMsFCqYXFYSAW0XP92VxTKm69oYxIUj7lEKbBCtdQKqAHeCZ/oHz2p9X8aQsus08gA2SWZgR+nIY2l
 EX+Ju+kvvmLbOtCV157do2r3KiuduqxkxJ7DZz5bWalf1OKncIwBW6od3JpQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE

The MAX34417 is a specialized current and voltage monitor used to
determine power consumption of portable systems. The driver supports
getting the channels voltage, average power and accumulated average
power and energy over an I2C/SMBUS serial interface.

The MAX34417 datasheet only specified on how to calculate the
accumulated average power, but with the Sample Per Second rate
we can easily get accumulated Energy in Joules.

By default the IIO driver only supports single-shot Voltage
and Power sensing, but the accumulation can be enabled by
enabling the Energy IIO channel which then enables the
Continuous Accumulation Mode.

The counter is common to all channels, so when reading a single
channel we will copy all accumulators to registers, so in order
to permit reading individual channels we must accumulate the
other channels in the driver when Continuous Accumulation Mode
is enabled.

The get_unaligned_be56() helper is added since we effectly
get an unaligned 56bit value from the HW.

While Analog Devices originally provided an HWMON driver for this
IC, using IIO makes much more sense because it provides
much more flexibility to support getting the power values
and will make it easier to support trigger to dump all
channels in a single shot and then support the Bulk Update
feature to update all MAX34417 on the same bus via the
trigger mechanism.

The v3 implementation has been completely revised since
v1/v2 to better match the capabilities of the MAX34417 and
allow getting accumulated Energy plus provide single
channel read without loosing other channels accumulations.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v6:
- Fixed sashiko comments
  - Fixed the binding example indentation
  - Added a timestamp to make sure we don't call UPDATE in less than 1ms
  - Switched ENERGY to return Joules instead of mJ, simplifying the scale formlula and use IIO_VAL_FRACTIONAL_LOG2
- Dropped using SMM and using the default mode, simplifies the process for same result
- Added software overflow check
- Switch to s64/s32 everywhere to make sure we don't mess the sign since we return signed int values
- Added readable_noinc_reg to mark the data regs as noinc
- Added explicit comments on the OVF check, UPDATE sequencing and byte0 content
- Dropped the channel type in the channel label
- Moved the DT channel probe into a separate function
- Link to v5: https://patch.msgid.link/20261102-topic-sm8x50-iio-max34417-adc-v5-0-0ffa5e5f2d5c@linaro.org

Changes in v5:
- Collected review tags
- Fixed patch 2 commit message
- Added sysfs.h include
- Finished all struct max34417_data with .
- Added explicit MAX34417_CONTROL_REG: to is_volatile callback
- Added local *map to all functions, shortening regmap calls
- Explicited the 1ms UPDATE delay for manual mode
- Simplified max34417_check_ovf logic
- Simplified acc_count == 0 logic
- Used iio_val_s64_decompose
- Used regmap_update_bits to compine regmap clear and set
- Added switch instead of if/else for IIO_CHAN_INFO_SCALE
- Changed max34417_calc_input_correction comment and return type
- Switch to rsense_uOhm
- Return -ECHRNG for invalide channel count
- Link to v4: https://patch.msgid.link/20261028-topic-sm8x50-iio-max34417-adc-v4-0-d4baaf3ee903@linaro.org

Changes in v4:
- Fix bindings with Conor review on v2
 - Rename to Analog Devices and "adi" prefix
 - Move reg before #*-cells
 - Remove "label: true"
 - Make supplies required
 - Update DT example
- Rebase on linux-next
- Fix RSENSE defines
- Drop dev from max34417_data struct
- Move acc_count to u64
- Add regmap writeable/readable/volatile callbacks
- Use regmap_set/clear_bits() when needed
- Fix MAX34417_CHANNEL layout
- Drop useless comments
- Move i in the "for (int i...") and use i++ instead of ++i
- Move mutex guard into iio callbacks
- Use lower_32_bits/upper_32_bits instead of FIELD_GET()
- Use div_u64() when returning the Power scale to make sure it runs on 32bit systems
- Reorganize the get_label() callback
- Use devm_mutex_init
- Drop fwnode_property_present(node, "reg") before getting reg
- Rename rsense variable to rsense_microOhm
- Drop !rsense test
- Register iio device after device init
- Add comment about supporting MAX34407
- Link to v3: https://patch.msgid.link/20261013-topic-sm8x50-iio-max34417-adc-v3-0-d3604ae4a229@linaro.org

Changes in v3:
- Implement Continuous Accumulate Mode and default to single-shot mode
- Fix includes
- Better define Rsense and default rsensd in driver & bindings
- Define all read length and offsets
- Define the SPS bits
- Fix comments first letters
- Fix max register
- Add ENERGY channel with shared enable for Continuous Accumulate Mode
- By default reset the MAX34417 counters for each readout to do a single-shot measure
- Handle zero counter
- Add get_unaligned_be56
- Use get_unaligned_* macros
- Better handle the DT properties and report errors
- Reset the MAX34417 at the end of probe
- Link to v2: https://patch.msgid.link/20260924-topic-sm8x50-iio-max34417-adc-v2-0-9a0609e72f5c@linaro.org

Changes in v2:
- switch to shunt-resistor-micro-ohms no more required
- removed gpio.h from example
- Fixed max34417->MAX34417 in Kconfig and comments
- Added missing includes and remove unneeded
- Fixed typos in comments
- Switched to fsleep()
- Better aligned max34417_read_power declararation
- Handled 0 acc_count
- Switched to GENMASK_ULL() for 32bits systems
- Added missing empty lines
- Moved the input correction into a helper
- Set default input correction for all channels
- Switched to dev_err_probe() to return from probe
- Switched to device_for_each_child_node_scoped()
- Handled invalid shunt-resistor-micro-ohms value
- Link to v1: https://patch.msgid.link/20260923-topic-sm8x50-iio-max34417-adc-v1-0-41d4ba1bfc41@linaro.org

To: Jonathan Cameron <jic23@kernel.org>
To: David Lechner <dlechner@baylibre.com>
To: Nuno Sá <nuno.sa@analog.com>
To: Andy Shevchenko <andy@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux@analog.com

---
Marius Cristea (1):
      unaligned: introduce be56 unaligned accessors

Neil Armstrong (2):
      dt-bindings: iio: add: document the MAX34417 Four-Channel High Dynamic Range Power Accumulator
      iio: adc: add driver for the MAX34417 Four-Channel High Dynamic Range Power Accumulator

 .../devicetree/bindings/iio/adc/adi,max34417.yaml  | 103 +++
 drivers/iio/adc/Kconfig                            |  11 +
 drivers/iio/adc/Makefile                           |   1 +
 drivers/iio/adc/max34417.c                         | 845 +++++++++++++++++++++
 include/linux/unaligned.h                          |  27 +
 5 files changed, 987 insertions(+)
---
base-commit: 54729cd85a044e8e2ee3f73ddda2d7c2fb39e199
change-id: 20260923-topic-sm8x50-iio-max34417-adc-209e880533fb

Best regards,
--  
Neil Armstrong <neil.armstrong@linaro.org>

