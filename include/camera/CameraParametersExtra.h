/*
 * Copyright (C) 2015 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#define CAMERA_PARAMETERS_EXTRA_C \
const char CameraParameters::KEY_CONTINUOUS_BURST_NUM[] = "continuous-burst-num"; \
const char CameraParameters::KEY_CONTINUOUS_BURST_FPS[] = "continuous-burst-fps"; \
\
/* LAST_LINE OF CAMERA_PARAMETERS_EXTRA_C, every line before this one *MUST* have
 * a backslash \ at the end of the line or else everything will break.
 */

#define CAMERA_PARAMETERS_EXTRA_H \
    static const char KEY_CONTINUOUS_BURST_NUM[]; \
    static const char KEY_CONTINUOUS_BURST_FPS[]; \
    \
    /* LAST_LINE OF CAMERA_PARAMETERS_EXTRA_H, every line before this one *MUST* have
     * a backslash \ at the end of the line or else everything will break.
     */
