Return-Path: <bastiangermann@fishpost.de>
Return-path: <bastiangermann@fishpost.de>
From: Bastian Germann <bastiangermann@fishpost.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Luca Tettamanti <kronos.it@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: asus_atk0110: Use non-deprecated registration and managed memory
Date: Fri,  1 Jun 2018 17:14:17 +0200
Message-Id: <20180601151419.15820-1-bastiangermann@fishpost.de>
In-Reply-To: <8afcabf0-94c2-8068-5252-491494108a0c@roeck-us.net>
References: <8afcabf0-94c2-8068-5252-491494108a0c@roeck-us.net>
List-ID: <linux-hwmon@vger.kernel.org>

This is version 4 of my previously unversioned patch.

Version 2 addresses the issues brought up by Guenter.
The two v1 patches are joined in v2 1/2.
The unnecessary dynamic allocations are now part of the atk_data struct.
devm_kcalloc is used for the attribute array that is created from sensors.
v2 2/2 replaces all dynamic allocations in the driver with the device
managed devm_* versions. All corresponding kfree calls are removed.

Version 3 addresses the issue brought up by Andy.
v3 1/2 is unchanged. v3 2/2 reverses one of the devm_kzalloc changes of v2
because it introduces a memory leak.

v4 1/2 changes the attr_group field to only contain one item.
v4 2/2 is unchanged.
